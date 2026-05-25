//
// Created by Isidora Jovanovic on 17/05/2026.
// resources: https://www.compilersutra.com/docs/llvm/llvm_basic/pass/Create_LLVM_Pass_As_A_Plugin/
//
#include "llvm/IR/PassManager.h"                // base of every pass
#include "llvm/Passes/PassBuilder.h"            // opt uses PassBuilder to find and run our pass
#include "llvm/Passes/PassPlugin.h"             // llvmGetPassPluginInfo() func
#include "llvm/Analysis/LoopInfo.h"             // gives us the info about the loops
#include "llvm/Transforms/Utils/UnrollLoop.h"   // actual unrolling of the loop
#include "llvm/IR/InlineAsm.h"
#include "llvm/Analysis/OptimizationRemarkEmitter.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/IR/Dominators.h"


using namespace llvm;

class LoopUnrollPass : public PassInfoMixin<LoopUnrollPass> {
public:
    PreservedAnalyses run(Loop &loop, LoopAnalysisManager &analysis_manager,
                          LoopStandardAnalysisResults &analysis_res, LPMUpdater &updater) {
        // since we only want to unroll our aes loop we need to make sure that our loop is the right one
        // so iterate over all instructions to check if we have our aes32esmi instr
        for (BasicBlock *basic_block : loop.getBlocks()) {
            for (Instruction &instr : *basic_block) {
                // check if the instruction is an inline asm call
                if (auto *call_instr = dyn_cast<CallInst>(&instr)) {
                    if (call_instr->isInlineAsm()) {
                        auto *inline_asm = cast<InlineAsm>(call_instr->getCalledOperand());
                        StringRef asm_str = inline_asm->getAsmString();

                        if (asm_str.contains("aes32esmi")) {
                            // found our loop
                            UnrollLoopOptions unroll_options;
                            unroll_options.Count = 9;
                            unroll_options.Force = true;

                            UnrollLoop(&loop, unroll_options, &analysis_res.LI, &analysis_res.SE, &analysis_res.DT,
                                       &analysis_res.AC, nullptr, nullptr, true, nullptr, nullptr);

                            return PreservedAnalyses::none();
                        }
                    }
                }
            }
        }

        // did not find the loop we want to unroll so return without modifying anything
        return PreservedAnalyses::all();
    }
};

// registering the pass so LLVM can see it in the pipeline
// when we load the shared lib this is the entry point the LLVM looks for
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION, "AESLoopUnroll", LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                    [](StringRef Name, LoopPassManager &LPM,
                       ArrayRef<PassBuilder::PipelineElement>) {
                        if (Name == "aes-loop-unroll") {
                            LPM.addPass(LoopUnrollPass());
                            return true;
                        }
                        return false;
                    });
        }
    };
}
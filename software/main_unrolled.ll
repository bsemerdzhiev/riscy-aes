; ModuleID = 'main.ll'
source_filename = "main_d.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown"

@sbox = internal unnamed_addr constant [256 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB\E02:\0AI\06$\\\C2\D3\ACb\91\95\E4y\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8Ap>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16", align 1, !dbg !0
@rcon = internal unnamed_addr constant [10 x i8] c"\01\02\04\08\10 @\80\1B6", align 1, !dbg !14
@inv_matrix = internal unnamed_addr constant [4 x [4 x i8]] [[4 x i8] c"\0E\0B\0D\09", [4 x i8] c"\09\0E\0B\0D", [4 x i8] c"\0D\09\0E\0B", [4 x i8] c"\0B\0D\09\0E"], align 1, !dbg !23
@__const.main.ciphertext = private unnamed_addr constant [16 x i8] c"\14\09\A5\FB\1F\F4Kq\BE\AA%.\0F\08\F9\AA", align 1
@__const.main.key = private unnamed_addr constant [16 x i8] c"cese4040password", align 1
@__const.main.expected_output = private unnamed_addr constant [16 x i8] c"Hello, World!000", align 1

; Function Attrs: nofree norecurse nosync nounwind optsize memory(none)
define dso_local zeroext i8 @gf_mult(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #0 !dbg !40 {
    #dbg_value(i8 %0, !44, !DIExpression(), !53)
    #dbg_value(i8 %1, !45, !DIExpression(), !53)
    #dbg_value(i8 0, !46, !DIExpression(), !53)
    #dbg_value(i32 0, !47, !DIExpression(), !54)
  br label %4, !dbg !55

3:                                                ; preds = %4
  %.lcssa = phi i8 [ %12, %4 ], !dbg !56
  ret i8 %.lcssa, !dbg !58

4:                                                ; preds = %4, %2
  %5 = phi i8 [ %0, %2 ], [ %16, %4 ]
  %6 = phi i32 [ 0, %2 ], [ %18, %4 ]
  %7 = phi i8 [ 0, %2 ], [ %12, %4 ]
  %8 = phi i8 [ %1, %2 ], [ %17, %4 ]
    #dbg_value(i8 %5, !44, !DIExpression(), !53)
    #dbg_value(i32 %6, !47, !DIExpression(), !54)
    #dbg_value(i8 %7, !46, !DIExpression(), !53)
    #dbg_value(i8 %8, !45, !DIExpression(), !53)
  %9 = and i8 %8, 1, !dbg !56
  %10 = icmp eq i8 %9, 0, !dbg !56
  %11 = select i1 %10, i8 0, i8 %5, !dbg !56
  %12 = xor i8 %11, %7, !dbg !56
    #dbg_value(i8 %12, !46, !DIExpression(), !53)
    #dbg_value(i8 %5, !50, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !59)
  %13 = shl i8 %5, 1, !dbg !60
    #dbg_value(i8 %13, !44, !DIExpression(), !53)
  %14 = xor i8 %13, 27, !dbg !61
  %15 = icmp slt i8 %5, 0, !dbg !61
  %16 = select i1 %15, i8 %14, i8 %13, !dbg !61
    #dbg_value(i8 %16, !44, !DIExpression(), !53)
  %17 = lshr i8 %8, 1, !dbg !63
    #dbg_value(i8 %17, !45, !DIExpression(), !53)
  %18 = add nuw nsw i32 %6, 1, !dbg !64
    #dbg_value(i32 %18, !47, !DIExpression(), !54)
  %19 = icmp eq i32 %18, 8, !dbg !65
  br i1 %19, label %3, label %4, !dbg !55, !llvm.loop !66
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @expand_key(ptr nocapture noundef readonly %0, ptr nocapture noundef %1) local_unnamed_addr #2 !dbg !69 {
    #dbg_value(ptr %0, !74, !DIExpression(), !103)
    #dbg_value(ptr %1, !75, !DIExpression(), !103)
    #dbg_value(i32 0, !76, !DIExpression(), !103)
  br label %3, !dbg !104

3:                                                ; preds = %3, %2
  %4 = phi i32 [ 0, %2 ], [ %8, %3 ]
    #dbg_value(i32 %4, !76, !DIExpression(), !103)
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 %4, !dbg !106
  %6 = load i8, ptr %5, align 1, !dbg !106, !tbaa !109
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 %4, !dbg !112
  store i8 %6, ptr %7, align 1, !dbg !113, !tbaa !109
  %8 = add nuw nsw i32 %4, 1, !dbg !114
    #dbg_value(i32 %8, !76, !DIExpression(), !103)
  %9 = icmp eq i32 %8, 16, !dbg !115
  br i1 %9, label %.preheader1, label %3, !dbg !104, !llvm.loop !116

.preheader1:                                      ; preds = %3
  br label %10, !dbg !118

10:                                               ; preds = %.preheader1, %41
  %11 = phi i32 [ %64, %41 ], [ 16, %.preheader1 ]
    #dbg_value(i32 %11, !76, !DIExpression(), !103)
  %12 = getelementptr i8, ptr %1, i32 %11, !dbg !119
  %13 = getelementptr i8, ptr %12, i32 -4, !dbg !119
  %14 = load i8, ptr %13, align 1, !dbg !119, !tbaa !109
    #dbg_value(i8 %14, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !120)
  %15 = getelementptr i8, ptr %12, i32 -3, !dbg !121
  %16 = load i8, ptr %15, align 1, !dbg !121, !tbaa !109
    #dbg_value(i8 %16, !77, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !120)
  %17 = getelementptr i8, ptr %12, i32 -2, !dbg !122
  %18 = load i8, ptr %17, align 1, !dbg !122, !tbaa !109
    #dbg_value(i8 %18, !77, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !120)
  %19 = getelementptr i8, ptr %12, i32 -1, !dbg !123
  %20 = load i8, ptr %19, align 1, !dbg !123, !tbaa !109
    #dbg_value(i8 %20, !77, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !120)
  %21 = and i32 %11, 12, !dbg !124
  %22 = icmp eq i32 %21, 0, !dbg !125
  br i1 %22, label %23, label %41, !dbg !125

23:                                               ; preds = %10
    #dbg_value(i8 %14, !83, !DIExpression(), !126)
  %24 = zext i8 %16 to i32, !dbg !127
  %25 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %24, !dbg !127
  %26 = load i8, ptr %25, align 1, !dbg !127, !tbaa !109
    #dbg_value(i8 %26, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !120)
  %27 = zext i8 %18 to i32, !dbg !128
  %28 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %27, !dbg !128
  %29 = load i8, ptr %28, align 1, !dbg !128, !tbaa !109
    #dbg_value(i8 %29, !77, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !120)
  %30 = zext i8 %20 to i32, !dbg !129
  %31 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %30, !dbg !129
  %32 = load i8, ptr %31, align 1, !dbg !129, !tbaa !109
    #dbg_value(i8 %32, !77, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !120)
  %33 = zext i8 %14 to i32, !dbg !130
  %34 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %33, !dbg !130
  %35 = load i8, ptr %34, align 1, !dbg !130, !tbaa !109
    #dbg_value(i8 %35, !77, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !120)
  %36 = lshr exact i32 %11, 4, !dbg !131
  %37 = add nsw i32 %36, -1, !dbg !132
  %38 = getelementptr inbounds [10 x i8], ptr @rcon, i32 0, i32 %37, !dbg !133
  %39 = load i8, ptr %38, align 1, !dbg !133, !tbaa !109
  %40 = xor i8 %39, %26, !dbg !134
    #dbg_value(i8 %40, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !120)
  br label %41, !dbg !135

41:                                               ; preds = %23, %10
  %42 = phi i8 [ %40, %23 ], [ %14, %10 ], !dbg !120
  %43 = phi i8 [ %29, %23 ], [ %16, %10 ], !dbg !120
  %44 = phi i8 [ %32, %23 ], [ %18, %10 ], !dbg !120
  %45 = phi i8 [ %35, %23 ], [ %20, %10 ], !dbg !120
    #dbg_value(i8 %45, !77, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !120)
    #dbg_value(i8 %44, !77, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !120)
    #dbg_value(i8 %43, !77, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !120)
    #dbg_value(i8 %42, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !120)
  %46 = getelementptr i8, ptr %12, i32 -16, !dbg !136
  %47 = load i8, ptr %46, align 1, !dbg !136, !tbaa !109
  %48 = xor i8 %47, %42, !dbg !137
  store i8 %48, ptr %12, align 1, !dbg !138, !tbaa !109
  %49 = getelementptr i8, ptr %12, i32 -15, !dbg !139
  %50 = load i8, ptr %49, align 1, !dbg !139, !tbaa !109
  %51 = xor i8 %50, %43, !dbg !140
  %52 = or disjoint i32 %11, 1, !dbg !141
  %53 = getelementptr inbounds nuw i8, ptr %1, i32 %52, !dbg !142
  store i8 %51, ptr %53, align 1, !dbg !143, !tbaa !109
  %54 = getelementptr i8, ptr %12, i32 -14, !dbg !144
  %55 = load i8, ptr %54, align 1, !dbg !144, !tbaa !109
  %56 = xor i8 %55, %44, !dbg !145
  %57 = or disjoint i32 %11, 2, !dbg !146
  %58 = getelementptr inbounds nuw i8, ptr %1, i32 %57, !dbg !147
  store i8 %56, ptr %58, align 1, !dbg !148, !tbaa !109
  %59 = getelementptr i8, ptr %12, i32 -13, !dbg !149
  %60 = load i8, ptr %59, align 1, !dbg !149, !tbaa !109
  %61 = xor i8 %60, %45, !dbg !150
  %62 = or disjoint i32 %11, 3, !dbg !151
  %63 = getelementptr inbounds nuw i8, ptr %1, i32 %62, !dbg !152
  store i8 %61, ptr %63, align 1, !dbg !153, !tbaa !109
  %64 = add nuw nsw i32 %11, 4, !dbg !154
    #dbg_value(i32 %64, !76, !DIExpression(), !103)
  %65 = icmp samesign ult i32 %11, 172, !dbg !155
  br i1 %65, label %10, label %.preheader, !dbg !118, !llvm.loop !156

.preheader:                                       ; preds = %41
  br label %67, !dbg !158

66:                                               ; preds = %70
  ret void, !dbg !159

67:                                               ; preds = %.preheader, %70
  %68 = phi i32 [ %71, %70 ], [ 16, %.preheader ]
    #dbg_value(i32 %68, !86, !DIExpression(), !160)
  %69 = getelementptr inbounds nuw i8, ptr %1, i32 %68, !dbg !161
    #dbg_value(ptr %69, !90, !DIExpression(), !162)
    #dbg_value(i32 0, !93, !DIExpression(), !163)
  br label %73, !dbg !164

70:                                               ; preds = %87
  %71 = add nuw nsw i32 %68, 16, !dbg !165
    #dbg_value(i32 %71, !86, !DIExpression(), !160)
  %72 = icmp samesign ult i32 %68, 144, !dbg !166
  br i1 %72, label %67, label %66, !dbg !158, !llvm.loop !167

73:                                               ; preds = %87, %67
  %74 = phi i32 [ 0, %67 ], [ %88, %87 ]
    #dbg_value(i32 %74, !93, !DIExpression(), !163)
  %75 = shl nuw nsw i32 %74, 2, !dbg !169
  %76 = getelementptr inbounds nuw i8, ptr %69, i32 %75, !dbg !170
  %77 = load i8, ptr %76, align 1, !dbg !170, !tbaa !109
    #dbg_value(i8 %77, !95, !DIExpression(), !171)
  %78 = or disjoint i32 %75, 1, !dbg !172
  %79 = getelementptr inbounds nuw i8, ptr %69, i32 %78, !dbg !173
  %80 = load i8, ptr %79, align 1, !dbg !173, !tbaa !109
    #dbg_value(i8 %80, !98, !DIExpression(), !171)
  %81 = or disjoint i32 %75, 2, !dbg !174
  %82 = getelementptr inbounds nuw i8, ptr %69, i32 %81, !dbg !175
  %83 = load i8, ptr %82, align 1, !dbg !175, !tbaa !109
    #dbg_value(i8 %83, !99, !DIExpression(), !171)
  %84 = or disjoint i32 %75, 3, !dbg !176
  %85 = getelementptr inbounds nuw i8, ptr %69, i32 %84, !dbg !177
  %86 = load i8, ptr %85, align 1, !dbg !177, !tbaa !109
    #dbg_value(i8 %86, !100, !DIExpression(), !171)
    #dbg_value(i32 0, !101, !DIExpression(), !178)
  br label %90, !dbg !179

87:                                               ; preds = %168
  %88 = add nuw nsw i32 %74, 1, !dbg !180
    #dbg_value(i32 %88, !93, !DIExpression(), !163)
  %89 = icmp eq i32 %88, 4, !dbg !181
  br i1 %89, label %70, label %73, !dbg !164, !llvm.loop !182

90:                                               ; preds = %168, %73
  %91 = phi i32 [ 0, %73 ], [ %173, %168 ]
    #dbg_value(i32 %91, !101, !DIExpression(), !178)
  %92 = getelementptr inbounds nuw [4 x [4 x i8]], ptr @inv_matrix, i32 0, i32 %91, !dbg !184
  %93 = load i8, ptr %92, align 1, !dbg !184, !tbaa !109
    #dbg_value(i8 %93, !44, !DIExpression(), !187)
    #dbg_value(i8 %77, !45, !DIExpression(), !187)
    #dbg_value(i8 0, !46, !DIExpression(), !187)
    #dbg_value(i32 0, !47, !DIExpression(), !189)
  br label %94, !dbg !190

94:                                               ; preds = %94, %90
  %95 = phi i8 [ %93, %90 ], [ %106, %94 ]
  %96 = phi i32 [ 0, %90 ], [ %108, %94 ]
  %97 = phi i8 [ 0, %90 ], [ %102, %94 ]
  %98 = phi i8 [ %77, %90 ], [ %107, %94 ]
    #dbg_value(i8 %95, !44, !DIExpression(), !187)
    #dbg_value(i32 %96, !47, !DIExpression(), !189)
    #dbg_value(i8 %97, !46, !DIExpression(), !187)
    #dbg_value(i8 %98, !45, !DIExpression(), !187)
  %99 = and i8 %98, 1, !dbg !191
  %100 = icmp eq i8 %99, 0, !dbg !191
  %101 = select i1 %100, i8 0, i8 %95, !dbg !191
  %102 = xor i8 %101, %97, !dbg !191
    #dbg_value(i8 %102, !46, !DIExpression(), !187)
    #dbg_value(i8 %95, !50, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !192)
  %103 = shl i8 %95, 1, !dbg !193
    #dbg_value(i8 %103, !44, !DIExpression(), !187)
  %104 = xor i8 %103, 27, !dbg !194
  %105 = icmp slt i8 %95, 0, !dbg !194
  %106 = select i1 %105, i8 %104, i8 %103, !dbg !194
    #dbg_value(i8 %106, !44, !DIExpression(), !187)
  %107 = lshr i8 %98, 1, !dbg !195
    #dbg_value(i8 %107, !45, !DIExpression(), !187)
  %108 = add nuw nsw i32 %96, 1, !dbg !196
    #dbg_value(i32 %108, !47, !DIExpression(), !189)
  %109 = icmp eq i32 %108, 8, !dbg !197
  br i1 %109, label %110, label %94, !dbg !190, !llvm.loop !198

110:                                              ; preds = %94
  %.lcssa = phi i8 [ %102, %94 ], !dbg !191
  %111 = getelementptr inbounds nuw i8, ptr %92, i32 1, !dbg !200
  %112 = load i8, ptr %111, align 1, !dbg !200, !tbaa !109
    #dbg_value(i8 %112, !44, !DIExpression(), !201)
    #dbg_value(i8 %80, !45, !DIExpression(), !201)
    #dbg_value(i8 0, !46, !DIExpression(), !201)
    #dbg_value(i32 0, !47, !DIExpression(), !203)
  br label %113, !dbg !204

113:                                              ; preds = %113, %110
  %114 = phi i8 [ %112, %110 ], [ %125, %113 ]
  %115 = phi i32 [ 0, %110 ], [ %127, %113 ]
  %116 = phi i8 [ 0, %110 ], [ %121, %113 ]
  %117 = phi i8 [ %80, %110 ], [ %126, %113 ]
    #dbg_value(i8 %114, !44, !DIExpression(), !201)
    #dbg_value(i32 %115, !47, !DIExpression(), !203)
    #dbg_value(i8 %116, !46, !DIExpression(), !201)
    #dbg_value(i8 %117, !45, !DIExpression(), !201)
  %118 = and i8 %117, 1, !dbg !205
  %119 = icmp eq i8 %118, 0, !dbg !205
  %120 = select i1 %119, i8 0, i8 %114, !dbg !205
  %121 = xor i8 %120, %116, !dbg !205
    #dbg_value(i8 %121, !46, !DIExpression(), !201)
    #dbg_value(i8 %114, !50, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !206)
  %122 = shl i8 %114, 1, !dbg !207
    #dbg_value(i8 %122, !44, !DIExpression(), !201)
  %123 = xor i8 %122, 27, !dbg !208
  %124 = icmp slt i8 %114, 0, !dbg !208
  %125 = select i1 %124, i8 %123, i8 %122, !dbg !208
    #dbg_value(i8 %125, !44, !DIExpression(), !201)
  %126 = lshr i8 %117, 1, !dbg !209
    #dbg_value(i8 %126, !45, !DIExpression(), !201)
  %127 = add nuw nsw i32 %115, 1, !dbg !210
    #dbg_value(i32 %127, !47, !DIExpression(), !203)
  %128 = icmp eq i32 %127, 8, !dbg !211
  br i1 %128, label %129, label %113, !dbg !204, !llvm.loop !212

129:                                              ; preds = %113
  %.lcssa2 = phi i8 [ %121, %113 ], !dbg !205
  %130 = getelementptr inbounds nuw i8, ptr %92, i32 2, !dbg !214
  %131 = load i8, ptr %130, align 1, !dbg !214, !tbaa !109
    #dbg_value(i8 %131, !44, !DIExpression(), !215)
    #dbg_value(i8 %83, !45, !DIExpression(), !215)
    #dbg_value(i8 0, !46, !DIExpression(), !215)
    #dbg_value(i32 0, !47, !DIExpression(), !217)
  br label %132, !dbg !218

132:                                              ; preds = %132, %129
  %133 = phi i8 [ %131, %129 ], [ %144, %132 ]
  %134 = phi i32 [ 0, %129 ], [ %146, %132 ]
  %135 = phi i8 [ 0, %129 ], [ %140, %132 ]
  %136 = phi i8 [ %83, %129 ], [ %145, %132 ]
    #dbg_value(i8 %133, !44, !DIExpression(), !215)
    #dbg_value(i32 %134, !47, !DIExpression(), !217)
    #dbg_value(i8 %135, !46, !DIExpression(), !215)
    #dbg_value(i8 %136, !45, !DIExpression(), !215)
  %137 = and i8 %136, 1, !dbg !219
  %138 = icmp eq i8 %137, 0, !dbg !219
  %139 = select i1 %138, i8 0, i8 %133, !dbg !219
  %140 = xor i8 %139, %135, !dbg !219
    #dbg_value(i8 %140, !46, !DIExpression(), !215)
    #dbg_value(i8 %133, !50, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !220)
  %141 = shl i8 %133, 1, !dbg !221
    #dbg_value(i8 %141, !44, !DIExpression(), !215)
  %142 = xor i8 %141, 27, !dbg !222
  %143 = icmp slt i8 %133, 0, !dbg !222
  %144 = select i1 %143, i8 %142, i8 %141, !dbg !222
    #dbg_value(i8 %144, !44, !DIExpression(), !215)
  %145 = lshr i8 %136, 1, !dbg !223
    #dbg_value(i8 %145, !45, !DIExpression(), !215)
  %146 = add nuw nsw i32 %134, 1, !dbg !224
    #dbg_value(i32 %146, !47, !DIExpression(), !217)
  %147 = icmp eq i32 %146, 8, !dbg !225
  br i1 %147, label %148, label %132, !dbg !218, !llvm.loop !226

148:                                              ; preds = %132
  %.lcssa3 = phi i8 [ %140, %132 ], !dbg !219
  %149 = xor i8 %.lcssa2, %.lcssa, !dbg !228
  %150 = getelementptr inbounds nuw i8, ptr %92, i32 3, !dbg !229
  %151 = load i8, ptr %150, align 1, !dbg !229, !tbaa !109
    #dbg_value(i8 %151, !44, !DIExpression(), !230)
    #dbg_value(i8 %86, !45, !DIExpression(), !230)
    #dbg_value(i8 0, !46, !DIExpression(), !230)
    #dbg_value(i32 0, !47, !DIExpression(), !232)
  br label %152, !dbg !233

152:                                              ; preds = %152, %148
  %153 = phi i8 [ %151, %148 ], [ %164, %152 ]
  %154 = phi i32 [ 0, %148 ], [ %166, %152 ]
  %155 = phi i8 [ 0, %148 ], [ %160, %152 ]
  %156 = phi i8 [ %86, %148 ], [ %165, %152 ]
    #dbg_value(i8 %153, !44, !DIExpression(), !230)
    #dbg_value(i32 %154, !47, !DIExpression(), !232)
    #dbg_value(i8 %155, !46, !DIExpression(), !230)
    #dbg_value(i8 %156, !45, !DIExpression(), !230)
  %157 = and i8 %156, 1, !dbg !234
  %158 = icmp eq i8 %157, 0, !dbg !234
  %159 = select i1 %158, i8 0, i8 %153, !dbg !234
  %160 = xor i8 %159, %155, !dbg !234
    #dbg_value(i8 %160, !46, !DIExpression(), !230)
    #dbg_value(i8 %153, !50, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !235)
  %161 = shl i8 %153, 1, !dbg !236
    #dbg_value(i8 %161, !44, !DIExpression(), !230)
  %162 = xor i8 %161, 27, !dbg !237
  %163 = icmp slt i8 %153, 0, !dbg !237
  %164 = select i1 %163, i8 %162, i8 %161, !dbg !237
    #dbg_value(i8 %164, !44, !DIExpression(), !230)
  %165 = lshr i8 %156, 1, !dbg !238
    #dbg_value(i8 %165, !45, !DIExpression(), !230)
  %166 = add nuw nsw i32 %154, 1, !dbg !239
    #dbg_value(i32 %166, !47, !DIExpression(), !232)
  %167 = icmp eq i32 %166, 8, !dbg !240
  br i1 %167, label %168, label %152, !dbg !233, !llvm.loop !241

168:                                              ; preds = %152
  %.lcssa4 = phi i8 [ %160, %152 ], !dbg !234
  %169 = xor i8 %149, %.lcssa3, !dbg !243
  %170 = xor i8 %169, %.lcssa4, !dbg !244
  %171 = or disjoint i32 %91, %75, !dbg !245
  %172 = getelementptr inbounds nuw i8, ptr %69, i32 %171, !dbg !246
  store i8 %170, ptr %172, align 1, !dbg !247, !tbaa !109
  %173 = add nuw nsw i32 %91, 1, !dbg !248
    #dbg_value(i32 %173, !101, !DIExpression(), !178)
  %174 = icmp eq i32 %173, 4, !dbg !249
  br i1 %174, label %87, label %90, !dbg !179, !llvm.loop !250
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @add_round_key(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #2 !dbg !252 {
    #dbg_value(ptr %0, !254, !DIExpression(), !258)
    #dbg_value(ptr %1, !255, !DIExpression(), !258)
    #dbg_value(i32 0, !256, !DIExpression(), !259)
  br label %4, !dbg !260

3:                                                ; preds = %4
  ret void, !dbg !261

4:                                                ; preds = %4, %2
  %5 = phi i32 [ 0, %2 ], [ %11, %4 ]
    #dbg_value(i32 %5, !256, !DIExpression(), !259)
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 %5, !dbg !262
  %7 = load i8, ptr %6, align 1, !dbg !262, !tbaa !109
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 %5, !dbg !265
  %9 = load i8, ptr %8, align 1, !dbg !266, !tbaa !109
  %10 = xor i8 %9, %7, !dbg !266
  store i8 %10, ptr %8, align 1, !dbg !266, !tbaa !109
  %11 = add nuw nsw i32 %5, 1, !dbg !267
    #dbg_value(i32 %11, !256, !DIExpression(), !259)
  %12 = icmp eq i32 %11, 16, !dbg !268
  br i1 %12, label %3, label %4, !dbg !260, !llvm.loop !269
}

; Function Attrs: nounwind optsize
define dso_local void @aes128_decrypt_block(ptr nocapture noundef writeonly %0, ptr nocapture noundef %1, ptr nocapture noundef readonly %2) local_unnamed_addr #3 !dbg !271 {
  %4 = alloca [16 x i8], align 1, !DIAssignID !290
    #dbg_assign(i1 undef, !278, !DIExpression(), !290, ptr %4, !DIExpression(), !291)
    #dbg_value(ptr %0, !275, !DIExpression(), !291)
    #dbg_value(ptr %1, !276, !DIExpression(), !291)
    #dbg_value(ptr %2, !277, !DIExpression(), !291)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #6, !dbg !292
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %4, ptr noundef nonnull align 1 dereferenceable(16) %2, i32 16, i1 false), !dbg !293, !DIAssignID !294
    #dbg_assign(i1 undef, !278, !DIExpression(), !294, ptr %4, !DIExpression(), !291)
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 160, !dbg !295
    #dbg_value(ptr %4, !254, !DIExpression(), !296)
    #dbg_value(ptr %5, !255, !DIExpression(), !296)
    #dbg_value(i32 0, !256, !DIExpression(), !298)
  br label %6, !dbg !299

6:                                                ; preds = %6, %3
  %7 = phi i32 [ 0, %3 ], [ %13, %6 ]
    #dbg_value(i32 %7, !256, !DIExpression(), !298)
  %8 = getelementptr inbounds nuw i8, ptr %5, i32 %7, !dbg !300
  %9 = load i8, ptr %8, align 1, !dbg !300, !tbaa !109
  %10 = getelementptr inbounds nuw i8, ptr %4, i32 %7, !dbg !301
  %11 = load i8, ptr %10, align 1, !dbg !302, !tbaa !109
  %12 = xor i8 %11, %9, !dbg !302
  store i8 %12, ptr %10, align 1, !dbg !302, !tbaa !109
  %13 = add nuw nsw i32 %7, 1, !dbg !303
    #dbg_value(i32 %13, !256, !DIExpression(), !298)
  %14 = icmp eq i32 %13, 16, !dbg !304
  br i1 %14, label %15, label %6, !dbg !299, !llvm.loop !305

15:                                               ; preds = %6
  %16 = load i32, ptr %4, align 4, !tbaa !307
    #dbg_value(i32 9, !282, !DIExpression(), !309)
  %17 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %18 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %19 = getelementptr inbounds nuw i8, ptr %4, i32 4
  br label %20, !dbg !310

20:                                               ; preds = %15
    #dbg_value(i32 9, !282, !DIExpression(), !309)
    #dbg_value(ptr %4, !284, !DIExpression(), !311)
  %21 = getelementptr inbounds nuw i8, ptr %1, i32 144, !dbg !312
    #dbg_value(ptr %21, !287, !DIExpression(), !311)
  %22 = load i32, ptr %21, align 4, !dbg !313, !tbaa !307
  %23 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %22, i32 %16, i32 0, i32 %22) #6, !dbg !313, !srcloc !314
  store i32 %23, ptr %21, align 4, !dbg !313, !tbaa !307
  %24 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %25 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %23, i32 %24, i32 1, i32 %23) #6, !dbg !316, !srcloc !317
  store i32 %25, ptr %21, align 4, !dbg !316, !tbaa !307
  %26 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %27 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %25, i32 %26, i32 2, i32 %25) #6, !dbg !319, !srcloc !320
  store i32 %27, ptr %21, align 4, !dbg !319, !tbaa !307
  %28 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %29 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %27, i32 %28, i32 3, i32 %27) #6, !dbg !322, !srcloc !323
  store i32 %29, ptr %21, align 4, !dbg !322, !tbaa !307
  %30 = getelementptr inbounds nuw i8, ptr %21, i32 4, !dbg !324
  %31 = load i32, ptr %30, align 4, !dbg !325, !tbaa !307
  %32 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %31, i32 %28, i32 0, i32 %31) #6, !dbg !325, !srcloc !326
  store i32 %32, ptr %30, align 4, !dbg !325, !tbaa !307
  %33 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %32, i32 %16, i32 1, i32 %32) #6, !dbg !327, !srcloc !328
  store i32 %33, ptr %30, align 4, !dbg !327, !tbaa !307
  %34 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %33, i32 %24, i32 2, i32 %33) #6, !dbg !329, !srcloc !330
  store i32 %34, ptr %30, align 4, !dbg !329, !tbaa !307
  %35 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %34, i32 %26, i32 3, i32 %34) #6, !dbg !331, !srcloc !332
  store i32 %35, ptr %30, align 4, !dbg !331, !tbaa !307
  %36 = getelementptr inbounds nuw i8, ptr %21, i32 8, !dbg !333
  %37 = load i32, ptr %36, align 4, !dbg !334, !tbaa !307
  %38 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %37, i32 %26, i32 0, i32 %37) #6, !dbg !334, !srcloc !335
  store i32 %38, ptr %36, align 4, !dbg !334, !tbaa !307
  %39 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %38, i32 %28, i32 1, i32 %38) #6, !dbg !336, !srcloc !337
  store i32 %39, ptr %36, align 4, !dbg !336, !tbaa !307
  %40 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %39, i32 %16, i32 2, i32 %39) #6, !dbg !338, !srcloc !339
  store i32 %40, ptr %36, align 4, !dbg !338, !tbaa !307
  %41 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %40, i32 %24, i32 3, i32 %40) #6, !dbg !340, !srcloc !341
  store i32 %41, ptr %36, align 4, !dbg !340, !tbaa !307
  %42 = getelementptr inbounds nuw i8, ptr %21, i32 12, !dbg !342
  %43 = load i32, ptr %42, align 4, !dbg !343, !tbaa !307
  %44 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %43, i32 %24, i32 0, i32 %43) #6, !dbg !343, !srcloc !344
  store i32 %44, ptr %42, align 4, !dbg !343, !tbaa !307
  %45 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %44, i32 %26, i32 1, i32 %44) #6, !dbg !345, !srcloc !346
  store i32 %45, ptr %42, align 4, !dbg !345, !tbaa !307
  %46 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %45, i32 %28, i32 2, i32 %45) #6, !dbg !347, !srcloc !348
  store i32 %46, ptr %42, align 4, !dbg !347, !tbaa !307
  %47 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %46, i32 %16, i32 3, i32 %46) #6, !dbg !349, !srcloc !350
  store i32 %47, ptr %42, align 4, !dbg !349, !tbaa !307
  %48 = load i32, ptr %21, align 4, !dbg !351, !tbaa !307
  %49 = load i32, ptr %30, align 4, !dbg !352, !tbaa !307
  store i32 %49, ptr %19, align 4, !dbg !353, !tbaa !307
  %50 = load i32, ptr %36, align 4, !dbg !354, !tbaa !307
  store i32 %50, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %47, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 8, !282, !DIExpression(), !309)
  %51 = getelementptr inbounds nuw i8, ptr %1, i32 128, !dbg !312
    #dbg_value(ptr %51, !287, !DIExpression(), !311)
  %52 = load i32, ptr %51, align 4, !dbg !313, !tbaa !307
  %53 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %52, i32 %48, i32 0, i32 %52) #6, !dbg !313, !srcloc !314
  store i32 %53, ptr %51, align 4, !dbg !313, !tbaa !307
  %54 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %55 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %53, i32 %54, i32 1, i32 %53) #6, !dbg !316, !srcloc !317
  store i32 %55, ptr %51, align 4, !dbg !316, !tbaa !307
  %56 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %57 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %55, i32 %56, i32 2, i32 %55) #6, !dbg !319, !srcloc !320
  store i32 %57, ptr %51, align 4, !dbg !319, !tbaa !307
  %58 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %59 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %57, i32 %58, i32 3, i32 %57) #6, !dbg !322, !srcloc !323
  store i32 %59, ptr %51, align 4, !dbg !322, !tbaa !307
  %60 = getelementptr inbounds nuw i8, ptr %51, i32 4, !dbg !324
  %61 = load i32, ptr %60, align 4, !dbg !325, !tbaa !307
  %62 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %61, i32 %58, i32 0, i32 %61) #6, !dbg !325, !srcloc !326
  store i32 %62, ptr %60, align 4, !dbg !325, !tbaa !307
  %63 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %62, i32 %48, i32 1, i32 %62) #6, !dbg !327, !srcloc !328
  store i32 %63, ptr %60, align 4, !dbg !327, !tbaa !307
  %64 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %63, i32 %54, i32 2, i32 %63) #6, !dbg !329, !srcloc !330
  store i32 %64, ptr %60, align 4, !dbg !329, !tbaa !307
  %65 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %64, i32 %56, i32 3, i32 %64) #6, !dbg !331, !srcloc !332
  store i32 %65, ptr %60, align 4, !dbg !331, !tbaa !307
  %66 = getelementptr inbounds nuw i8, ptr %51, i32 8, !dbg !333
  %67 = load i32, ptr %66, align 4, !dbg !334, !tbaa !307
  %68 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %67, i32 %56, i32 0, i32 %67) #6, !dbg !334, !srcloc !335
  store i32 %68, ptr %66, align 4, !dbg !334, !tbaa !307
  %69 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %68, i32 %58, i32 1, i32 %68) #6, !dbg !336, !srcloc !337
  store i32 %69, ptr %66, align 4, !dbg !336, !tbaa !307
  %70 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %69, i32 %48, i32 2, i32 %69) #6, !dbg !338, !srcloc !339
  store i32 %70, ptr %66, align 4, !dbg !338, !tbaa !307
  %71 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %70, i32 %54, i32 3, i32 %70) #6, !dbg !340, !srcloc !341
  store i32 %71, ptr %66, align 4, !dbg !340, !tbaa !307
  %72 = getelementptr inbounds nuw i8, ptr %51, i32 12, !dbg !342
  %73 = load i32, ptr %72, align 4, !dbg !343, !tbaa !307
  %74 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %73, i32 %54, i32 0, i32 %73) #6, !dbg !343, !srcloc !344
  store i32 %74, ptr %72, align 4, !dbg !343, !tbaa !307
  %75 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %74, i32 %56, i32 1, i32 %74) #6, !dbg !345, !srcloc !346
  store i32 %75, ptr %72, align 4, !dbg !345, !tbaa !307
  %76 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %75, i32 %58, i32 2, i32 %75) #6, !dbg !347, !srcloc !348
  store i32 %76, ptr %72, align 4, !dbg !347, !tbaa !307
  %77 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %76, i32 %48, i32 3, i32 %76) #6, !dbg !349, !srcloc !350
  store i32 %77, ptr %72, align 4, !dbg !349, !tbaa !307
  %78 = load i32, ptr %51, align 4, !dbg !351, !tbaa !307
  %79 = load i32, ptr %60, align 4, !dbg !352, !tbaa !307
  store i32 %79, ptr %19, align 4, !dbg !353, !tbaa !307
  %80 = load i32, ptr %66, align 4, !dbg !354, !tbaa !307
  store i32 %80, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %77, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 7, !282, !DIExpression(), !309)
  %81 = getelementptr inbounds nuw i8, ptr %1, i32 112, !dbg !312
    #dbg_value(ptr %81, !287, !DIExpression(), !311)
  %82 = load i32, ptr %81, align 4, !dbg !313, !tbaa !307
  %83 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %82, i32 %78, i32 0, i32 %82) #6, !dbg !313, !srcloc !314
  store i32 %83, ptr %81, align 4, !dbg !313, !tbaa !307
  %84 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %85 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %83, i32 %84, i32 1, i32 %83) #6, !dbg !316, !srcloc !317
  store i32 %85, ptr %81, align 4, !dbg !316, !tbaa !307
  %86 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %87 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %85, i32 %86, i32 2, i32 %85) #6, !dbg !319, !srcloc !320
  store i32 %87, ptr %81, align 4, !dbg !319, !tbaa !307
  %88 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %89 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %87, i32 %88, i32 3, i32 %87) #6, !dbg !322, !srcloc !323
  store i32 %89, ptr %81, align 4, !dbg !322, !tbaa !307
  %90 = getelementptr inbounds nuw i8, ptr %81, i32 4, !dbg !324
  %91 = load i32, ptr %90, align 4, !dbg !325, !tbaa !307
  %92 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %91, i32 %88, i32 0, i32 %91) #6, !dbg !325, !srcloc !326
  store i32 %92, ptr %90, align 4, !dbg !325, !tbaa !307
  %93 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %92, i32 %78, i32 1, i32 %92) #6, !dbg !327, !srcloc !328
  store i32 %93, ptr %90, align 4, !dbg !327, !tbaa !307
  %94 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %93, i32 %84, i32 2, i32 %93) #6, !dbg !329, !srcloc !330
  store i32 %94, ptr %90, align 4, !dbg !329, !tbaa !307
  %95 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %94, i32 %86, i32 3, i32 %94) #6, !dbg !331, !srcloc !332
  store i32 %95, ptr %90, align 4, !dbg !331, !tbaa !307
  %96 = getelementptr inbounds nuw i8, ptr %81, i32 8, !dbg !333
  %97 = load i32, ptr %96, align 4, !dbg !334, !tbaa !307
  %98 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %97, i32 %86, i32 0, i32 %97) #6, !dbg !334, !srcloc !335
  store i32 %98, ptr %96, align 4, !dbg !334, !tbaa !307
  %99 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %98, i32 %88, i32 1, i32 %98) #6, !dbg !336, !srcloc !337
  store i32 %99, ptr %96, align 4, !dbg !336, !tbaa !307
  %100 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %99, i32 %78, i32 2, i32 %99) #6, !dbg !338, !srcloc !339
  store i32 %100, ptr %96, align 4, !dbg !338, !tbaa !307
  %101 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %100, i32 %84, i32 3, i32 %100) #6, !dbg !340, !srcloc !341
  store i32 %101, ptr %96, align 4, !dbg !340, !tbaa !307
  %102 = getelementptr inbounds nuw i8, ptr %81, i32 12, !dbg !342
  %103 = load i32, ptr %102, align 4, !dbg !343, !tbaa !307
  %104 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %103, i32 %84, i32 0, i32 %103) #6, !dbg !343, !srcloc !344
  store i32 %104, ptr %102, align 4, !dbg !343, !tbaa !307
  %105 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %104, i32 %86, i32 1, i32 %104) #6, !dbg !345, !srcloc !346
  store i32 %105, ptr %102, align 4, !dbg !345, !tbaa !307
  %106 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %105, i32 %88, i32 2, i32 %105) #6, !dbg !347, !srcloc !348
  store i32 %106, ptr %102, align 4, !dbg !347, !tbaa !307
  %107 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %106, i32 %78, i32 3, i32 %106) #6, !dbg !349, !srcloc !350
  store i32 %107, ptr %102, align 4, !dbg !349, !tbaa !307
  %108 = load i32, ptr %81, align 4, !dbg !351, !tbaa !307
  %109 = load i32, ptr %90, align 4, !dbg !352, !tbaa !307
  store i32 %109, ptr %19, align 4, !dbg !353, !tbaa !307
  %110 = load i32, ptr %96, align 4, !dbg !354, !tbaa !307
  store i32 %110, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %107, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 6, !282, !DIExpression(), !309)
  %111 = getelementptr inbounds nuw i8, ptr %1, i32 96, !dbg !312
    #dbg_value(ptr %111, !287, !DIExpression(), !311)
  %112 = load i32, ptr %111, align 4, !dbg !313, !tbaa !307
  %113 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %112, i32 %108, i32 0, i32 %112) #6, !dbg !313, !srcloc !314
  store i32 %113, ptr %111, align 4, !dbg !313, !tbaa !307
  %114 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %115 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %113, i32 %114, i32 1, i32 %113) #6, !dbg !316, !srcloc !317
  store i32 %115, ptr %111, align 4, !dbg !316, !tbaa !307
  %116 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %117 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %115, i32 %116, i32 2, i32 %115) #6, !dbg !319, !srcloc !320
  store i32 %117, ptr %111, align 4, !dbg !319, !tbaa !307
  %118 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %119 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %117, i32 %118, i32 3, i32 %117) #6, !dbg !322, !srcloc !323
  store i32 %119, ptr %111, align 4, !dbg !322, !tbaa !307
  %120 = getelementptr inbounds nuw i8, ptr %111, i32 4, !dbg !324
  %121 = load i32, ptr %120, align 4, !dbg !325, !tbaa !307
  %122 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %121, i32 %118, i32 0, i32 %121) #6, !dbg !325, !srcloc !326
  store i32 %122, ptr %120, align 4, !dbg !325, !tbaa !307
  %123 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %122, i32 %108, i32 1, i32 %122) #6, !dbg !327, !srcloc !328
  store i32 %123, ptr %120, align 4, !dbg !327, !tbaa !307
  %124 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %123, i32 %114, i32 2, i32 %123) #6, !dbg !329, !srcloc !330
  store i32 %124, ptr %120, align 4, !dbg !329, !tbaa !307
  %125 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %124, i32 %116, i32 3, i32 %124) #6, !dbg !331, !srcloc !332
  store i32 %125, ptr %120, align 4, !dbg !331, !tbaa !307
  %126 = getelementptr inbounds nuw i8, ptr %111, i32 8, !dbg !333
  %127 = load i32, ptr %126, align 4, !dbg !334, !tbaa !307
  %128 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %127, i32 %116, i32 0, i32 %127) #6, !dbg !334, !srcloc !335
  store i32 %128, ptr %126, align 4, !dbg !334, !tbaa !307
  %129 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %128, i32 %118, i32 1, i32 %128) #6, !dbg !336, !srcloc !337
  store i32 %129, ptr %126, align 4, !dbg !336, !tbaa !307
  %130 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %129, i32 %108, i32 2, i32 %129) #6, !dbg !338, !srcloc !339
  store i32 %130, ptr %126, align 4, !dbg !338, !tbaa !307
  %131 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %130, i32 %114, i32 3, i32 %130) #6, !dbg !340, !srcloc !341
  store i32 %131, ptr %126, align 4, !dbg !340, !tbaa !307
  %132 = getelementptr inbounds nuw i8, ptr %111, i32 12, !dbg !342
  %133 = load i32, ptr %132, align 4, !dbg !343, !tbaa !307
  %134 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %133, i32 %114, i32 0, i32 %133) #6, !dbg !343, !srcloc !344
  store i32 %134, ptr %132, align 4, !dbg !343, !tbaa !307
  %135 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %134, i32 %116, i32 1, i32 %134) #6, !dbg !345, !srcloc !346
  store i32 %135, ptr %132, align 4, !dbg !345, !tbaa !307
  %136 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %135, i32 %118, i32 2, i32 %135) #6, !dbg !347, !srcloc !348
  store i32 %136, ptr %132, align 4, !dbg !347, !tbaa !307
  %137 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %136, i32 %108, i32 3, i32 %136) #6, !dbg !349, !srcloc !350
  store i32 %137, ptr %132, align 4, !dbg !349, !tbaa !307
  %138 = load i32, ptr %111, align 4, !dbg !351, !tbaa !307
  %139 = load i32, ptr %120, align 4, !dbg !352, !tbaa !307
  store i32 %139, ptr %19, align 4, !dbg !353, !tbaa !307
  %140 = load i32, ptr %126, align 4, !dbg !354, !tbaa !307
  store i32 %140, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %137, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 5, !282, !DIExpression(), !309)
  %141 = getelementptr inbounds nuw i8, ptr %1, i32 80, !dbg !312
    #dbg_value(ptr %141, !287, !DIExpression(), !311)
  %142 = load i32, ptr %141, align 4, !dbg !313, !tbaa !307
  %143 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %142, i32 %138, i32 0, i32 %142) #6, !dbg !313, !srcloc !314
  store i32 %143, ptr %141, align 4, !dbg !313, !tbaa !307
  %144 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %145 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %143, i32 %144, i32 1, i32 %143) #6, !dbg !316, !srcloc !317
  store i32 %145, ptr %141, align 4, !dbg !316, !tbaa !307
  %146 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %147 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %145, i32 %146, i32 2, i32 %145) #6, !dbg !319, !srcloc !320
  store i32 %147, ptr %141, align 4, !dbg !319, !tbaa !307
  %148 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %149 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %147, i32 %148, i32 3, i32 %147) #6, !dbg !322, !srcloc !323
  store i32 %149, ptr %141, align 4, !dbg !322, !tbaa !307
  %150 = getelementptr inbounds nuw i8, ptr %141, i32 4, !dbg !324
  %151 = load i32, ptr %150, align 4, !dbg !325, !tbaa !307
  %152 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %151, i32 %148, i32 0, i32 %151) #6, !dbg !325, !srcloc !326
  store i32 %152, ptr %150, align 4, !dbg !325, !tbaa !307
  %153 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %152, i32 %138, i32 1, i32 %152) #6, !dbg !327, !srcloc !328
  store i32 %153, ptr %150, align 4, !dbg !327, !tbaa !307
  %154 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %153, i32 %144, i32 2, i32 %153) #6, !dbg !329, !srcloc !330
  store i32 %154, ptr %150, align 4, !dbg !329, !tbaa !307
  %155 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %154, i32 %146, i32 3, i32 %154) #6, !dbg !331, !srcloc !332
  store i32 %155, ptr %150, align 4, !dbg !331, !tbaa !307
  %156 = getelementptr inbounds nuw i8, ptr %141, i32 8, !dbg !333
  %157 = load i32, ptr %156, align 4, !dbg !334, !tbaa !307
  %158 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %157, i32 %146, i32 0, i32 %157) #6, !dbg !334, !srcloc !335
  store i32 %158, ptr %156, align 4, !dbg !334, !tbaa !307
  %159 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %158, i32 %148, i32 1, i32 %158) #6, !dbg !336, !srcloc !337
  store i32 %159, ptr %156, align 4, !dbg !336, !tbaa !307
  %160 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %159, i32 %138, i32 2, i32 %159) #6, !dbg !338, !srcloc !339
  store i32 %160, ptr %156, align 4, !dbg !338, !tbaa !307
  %161 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %160, i32 %144, i32 3, i32 %160) #6, !dbg !340, !srcloc !341
  store i32 %161, ptr %156, align 4, !dbg !340, !tbaa !307
  %162 = getelementptr inbounds nuw i8, ptr %141, i32 12, !dbg !342
  %163 = load i32, ptr %162, align 4, !dbg !343, !tbaa !307
  %164 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %163, i32 %144, i32 0, i32 %163) #6, !dbg !343, !srcloc !344
  store i32 %164, ptr %162, align 4, !dbg !343, !tbaa !307
  %165 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %164, i32 %146, i32 1, i32 %164) #6, !dbg !345, !srcloc !346
  store i32 %165, ptr %162, align 4, !dbg !345, !tbaa !307
  %166 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %165, i32 %148, i32 2, i32 %165) #6, !dbg !347, !srcloc !348
  store i32 %166, ptr %162, align 4, !dbg !347, !tbaa !307
  %167 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %166, i32 %138, i32 3, i32 %166) #6, !dbg !349, !srcloc !350
  store i32 %167, ptr %162, align 4, !dbg !349, !tbaa !307
  %168 = load i32, ptr %141, align 4, !dbg !351, !tbaa !307
  %169 = load i32, ptr %150, align 4, !dbg !352, !tbaa !307
  store i32 %169, ptr %19, align 4, !dbg !353, !tbaa !307
  %170 = load i32, ptr %156, align 4, !dbg !354, !tbaa !307
  store i32 %170, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %167, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 4, !282, !DIExpression(), !309)
  %171 = getelementptr inbounds nuw i8, ptr %1, i32 64, !dbg !312
    #dbg_value(ptr %171, !287, !DIExpression(), !311)
  %172 = load i32, ptr %171, align 4, !dbg !313, !tbaa !307
  %173 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %172, i32 %168, i32 0, i32 %172) #6, !dbg !313, !srcloc !314
  store i32 %173, ptr %171, align 4, !dbg !313, !tbaa !307
  %174 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %175 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %173, i32 %174, i32 1, i32 %173) #6, !dbg !316, !srcloc !317
  store i32 %175, ptr %171, align 4, !dbg !316, !tbaa !307
  %176 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %177 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %175, i32 %176, i32 2, i32 %175) #6, !dbg !319, !srcloc !320
  store i32 %177, ptr %171, align 4, !dbg !319, !tbaa !307
  %178 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %179 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %177, i32 %178, i32 3, i32 %177) #6, !dbg !322, !srcloc !323
  store i32 %179, ptr %171, align 4, !dbg !322, !tbaa !307
  %180 = getelementptr inbounds nuw i8, ptr %171, i32 4, !dbg !324
  %181 = load i32, ptr %180, align 4, !dbg !325, !tbaa !307
  %182 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %181, i32 %178, i32 0, i32 %181) #6, !dbg !325, !srcloc !326
  store i32 %182, ptr %180, align 4, !dbg !325, !tbaa !307
  %183 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %182, i32 %168, i32 1, i32 %182) #6, !dbg !327, !srcloc !328
  store i32 %183, ptr %180, align 4, !dbg !327, !tbaa !307
  %184 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %183, i32 %174, i32 2, i32 %183) #6, !dbg !329, !srcloc !330
  store i32 %184, ptr %180, align 4, !dbg !329, !tbaa !307
  %185 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %184, i32 %176, i32 3, i32 %184) #6, !dbg !331, !srcloc !332
  store i32 %185, ptr %180, align 4, !dbg !331, !tbaa !307
  %186 = getelementptr inbounds nuw i8, ptr %171, i32 8, !dbg !333
  %187 = load i32, ptr %186, align 4, !dbg !334, !tbaa !307
  %188 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %187, i32 %176, i32 0, i32 %187) #6, !dbg !334, !srcloc !335
  store i32 %188, ptr %186, align 4, !dbg !334, !tbaa !307
  %189 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %188, i32 %178, i32 1, i32 %188) #6, !dbg !336, !srcloc !337
  store i32 %189, ptr %186, align 4, !dbg !336, !tbaa !307
  %190 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %189, i32 %168, i32 2, i32 %189) #6, !dbg !338, !srcloc !339
  store i32 %190, ptr %186, align 4, !dbg !338, !tbaa !307
  %191 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %190, i32 %174, i32 3, i32 %190) #6, !dbg !340, !srcloc !341
  store i32 %191, ptr %186, align 4, !dbg !340, !tbaa !307
  %192 = getelementptr inbounds nuw i8, ptr %171, i32 12, !dbg !342
  %193 = load i32, ptr %192, align 4, !dbg !343, !tbaa !307
  %194 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %193, i32 %174, i32 0, i32 %193) #6, !dbg !343, !srcloc !344
  store i32 %194, ptr %192, align 4, !dbg !343, !tbaa !307
  %195 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %194, i32 %176, i32 1, i32 %194) #6, !dbg !345, !srcloc !346
  store i32 %195, ptr %192, align 4, !dbg !345, !tbaa !307
  %196 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %195, i32 %178, i32 2, i32 %195) #6, !dbg !347, !srcloc !348
  store i32 %196, ptr %192, align 4, !dbg !347, !tbaa !307
  %197 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %196, i32 %168, i32 3, i32 %196) #6, !dbg !349, !srcloc !350
  store i32 %197, ptr %192, align 4, !dbg !349, !tbaa !307
  %198 = load i32, ptr %171, align 4, !dbg !351, !tbaa !307
  %199 = load i32, ptr %180, align 4, !dbg !352, !tbaa !307
  store i32 %199, ptr %19, align 4, !dbg !353, !tbaa !307
  %200 = load i32, ptr %186, align 4, !dbg !354, !tbaa !307
  store i32 %200, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %197, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 3, !282, !DIExpression(), !309)
  %201 = getelementptr inbounds nuw i8, ptr %1, i32 48, !dbg !312
    #dbg_value(ptr %201, !287, !DIExpression(), !311)
  %202 = load i32, ptr %201, align 4, !dbg !313, !tbaa !307
  %203 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %202, i32 %198, i32 0, i32 %202) #6, !dbg !313, !srcloc !314
  store i32 %203, ptr %201, align 4, !dbg !313, !tbaa !307
  %204 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %205 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %203, i32 %204, i32 1, i32 %203) #6, !dbg !316, !srcloc !317
  store i32 %205, ptr %201, align 4, !dbg !316, !tbaa !307
  %206 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %207 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %205, i32 %206, i32 2, i32 %205) #6, !dbg !319, !srcloc !320
  store i32 %207, ptr %201, align 4, !dbg !319, !tbaa !307
  %208 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %209 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %207, i32 %208, i32 3, i32 %207) #6, !dbg !322, !srcloc !323
  store i32 %209, ptr %201, align 4, !dbg !322, !tbaa !307
  %210 = getelementptr inbounds nuw i8, ptr %201, i32 4, !dbg !324
  %211 = load i32, ptr %210, align 4, !dbg !325, !tbaa !307
  %212 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %211, i32 %208, i32 0, i32 %211) #6, !dbg !325, !srcloc !326
  store i32 %212, ptr %210, align 4, !dbg !325, !tbaa !307
  %213 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %212, i32 %198, i32 1, i32 %212) #6, !dbg !327, !srcloc !328
  store i32 %213, ptr %210, align 4, !dbg !327, !tbaa !307
  %214 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %213, i32 %204, i32 2, i32 %213) #6, !dbg !329, !srcloc !330
  store i32 %214, ptr %210, align 4, !dbg !329, !tbaa !307
  %215 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %214, i32 %206, i32 3, i32 %214) #6, !dbg !331, !srcloc !332
  store i32 %215, ptr %210, align 4, !dbg !331, !tbaa !307
  %216 = getelementptr inbounds nuw i8, ptr %201, i32 8, !dbg !333
  %217 = load i32, ptr %216, align 4, !dbg !334, !tbaa !307
  %218 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %217, i32 %206, i32 0, i32 %217) #6, !dbg !334, !srcloc !335
  store i32 %218, ptr %216, align 4, !dbg !334, !tbaa !307
  %219 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %218, i32 %208, i32 1, i32 %218) #6, !dbg !336, !srcloc !337
  store i32 %219, ptr %216, align 4, !dbg !336, !tbaa !307
  %220 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %219, i32 %198, i32 2, i32 %219) #6, !dbg !338, !srcloc !339
  store i32 %220, ptr %216, align 4, !dbg !338, !tbaa !307
  %221 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %220, i32 %204, i32 3, i32 %220) #6, !dbg !340, !srcloc !341
  store i32 %221, ptr %216, align 4, !dbg !340, !tbaa !307
  %222 = getelementptr inbounds nuw i8, ptr %201, i32 12, !dbg !342
  %223 = load i32, ptr %222, align 4, !dbg !343, !tbaa !307
  %224 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %223, i32 %204, i32 0, i32 %223) #6, !dbg !343, !srcloc !344
  store i32 %224, ptr %222, align 4, !dbg !343, !tbaa !307
  %225 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %224, i32 %206, i32 1, i32 %224) #6, !dbg !345, !srcloc !346
  store i32 %225, ptr %222, align 4, !dbg !345, !tbaa !307
  %226 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %225, i32 %208, i32 2, i32 %225) #6, !dbg !347, !srcloc !348
  store i32 %226, ptr %222, align 4, !dbg !347, !tbaa !307
  %227 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %226, i32 %198, i32 3, i32 %226) #6, !dbg !349, !srcloc !350
  store i32 %227, ptr %222, align 4, !dbg !349, !tbaa !307
  %228 = load i32, ptr %201, align 4, !dbg !351, !tbaa !307
  %229 = load i32, ptr %210, align 4, !dbg !352, !tbaa !307
  store i32 %229, ptr %19, align 4, !dbg !353, !tbaa !307
  %230 = load i32, ptr %216, align 4, !dbg !354, !tbaa !307
  store i32 %230, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %227, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 2, !282, !DIExpression(), !309)
  %231 = getelementptr inbounds nuw i8, ptr %1, i32 32, !dbg !312
    #dbg_value(ptr %231, !287, !DIExpression(), !311)
  %232 = load i32, ptr %231, align 4, !dbg !313, !tbaa !307
  %233 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %232, i32 %228, i32 0, i32 %232) #6, !dbg !313, !srcloc !314
  store i32 %233, ptr %231, align 4, !dbg !313, !tbaa !307
  %234 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %235 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %233, i32 %234, i32 1, i32 %233) #6, !dbg !316, !srcloc !317
  store i32 %235, ptr %231, align 4, !dbg !316, !tbaa !307
  %236 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %237 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %235, i32 %236, i32 2, i32 %235) #6, !dbg !319, !srcloc !320
  store i32 %237, ptr %231, align 4, !dbg !319, !tbaa !307
  %238 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %239 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %237, i32 %238, i32 3, i32 %237) #6, !dbg !322, !srcloc !323
  store i32 %239, ptr %231, align 4, !dbg !322, !tbaa !307
  %240 = getelementptr inbounds nuw i8, ptr %231, i32 4, !dbg !324
  %241 = load i32, ptr %240, align 4, !dbg !325, !tbaa !307
  %242 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %241, i32 %238, i32 0, i32 %241) #6, !dbg !325, !srcloc !326
  store i32 %242, ptr %240, align 4, !dbg !325, !tbaa !307
  %243 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %242, i32 %228, i32 1, i32 %242) #6, !dbg !327, !srcloc !328
  store i32 %243, ptr %240, align 4, !dbg !327, !tbaa !307
  %244 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %243, i32 %234, i32 2, i32 %243) #6, !dbg !329, !srcloc !330
  store i32 %244, ptr %240, align 4, !dbg !329, !tbaa !307
  %245 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %244, i32 %236, i32 3, i32 %244) #6, !dbg !331, !srcloc !332
  store i32 %245, ptr %240, align 4, !dbg !331, !tbaa !307
  %246 = getelementptr inbounds nuw i8, ptr %231, i32 8, !dbg !333
  %247 = load i32, ptr %246, align 4, !dbg !334, !tbaa !307
  %248 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %247, i32 %236, i32 0, i32 %247) #6, !dbg !334, !srcloc !335
  store i32 %248, ptr %246, align 4, !dbg !334, !tbaa !307
  %249 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %248, i32 %238, i32 1, i32 %248) #6, !dbg !336, !srcloc !337
  store i32 %249, ptr %246, align 4, !dbg !336, !tbaa !307
  %250 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %249, i32 %228, i32 2, i32 %249) #6, !dbg !338, !srcloc !339
  store i32 %250, ptr %246, align 4, !dbg !338, !tbaa !307
  %251 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %250, i32 %234, i32 3, i32 %250) #6, !dbg !340, !srcloc !341
  store i32 %251, ptr %246, align 4, !dbg !340, !tbaa !307
  %252 = getelementptr inbounds nuw i8, ptr %231, i32 12, !dbg !342
  %253 = load i32, ptr %252, align 4, !dbg !343, !tbaa !307
  %254 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %253, i32 %234, i32 0, i32 %253) #6, !dbg !343, !srcloc !344
  store i32 %254, ptr %252, align 4, !dbg !343, !tbaa !307
  %255 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %254, i32 %236, i32 1, i32 %254) #6, !dbg !345, !srcloc !346
  store i32 %255, ptr %252, align 4, !dbg !345, !tbaa !307
  %256 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %255, i32 %238, i32 2, i32 %255) #6, !dbg !347, !srcloc !348
  store i32 %256, ptr %252, align 4, !dbg !347, !tbaa !307
  %257 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %256, i32 %228, i32 3, i32 %256) #6, !dbg !349, !srcloc !350
  store i32 %257, ptr %252, align 4, !dbg !349, !tbaa !307
  %258 = load i32, ptr %231, align 4, !dbg !351, !tbaa !307
  %259 = load i32, ptr %240, align 4, !dbg !352, !tbaa !307
  store i32 %259, ptr %19, align 4, !dbg !353, !tbaa !307
  %260 = load i32, ptr %246, align 4, !dbg !354, !tbaa !307
  store i32 %260, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %257, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 1, !282, !DIExpression(), !309)
  %261 = getelementptr inbounds nuw i8, ptr %1, i32 16, !dbg !312
    #dbg_value(ptr %261, !287, !DIExpression(), !311)
  %262 = load i32, ptr %261, align 4, !dbg !313, !tbaa !307
  %263 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %262, i32 %258, i32 0, i32 %262) #6, !dbg !313, !srcloc !314
  store i32 %263, ptr %261, align 4, !dbg !313, !tbaa !307
  %264 = load i32, ptr %17, align 4, !dbg !315, !tbaa !307
  %265 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %263, i32 %264, i32 1, i32 %263) #6, !dbg !316, !srcloc !317
  store i32 %265, ptr %261, align 4, !dbg !316, !tbaa !307
  %266 = load i32, ptr %18, align 4, !dbg !318, !tbaa !307
  %267 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %265, i32 %266, i32 2, i32 %265) #6, !dbg !319, !srcloc !320
  store i32 %267, ptr %261, align 4, !dbg !319, !tbaa !307
  %268 = load i32, ptr %19, align 4, !dbg !321, !tbaa !307
  %269 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %267, i32 %268, i32 3, i32 %267) #6, !dbg !322, !srcloc !323
  store i32 %269, ptr %261, align 4, !dbg !322, !tbaa !307
  %270 = getelementptr inbounds nuw i8, ptr %261, i32 4, !dbg !324
  %271 = load i32, ptr %270, align 4, !dbg !325, !tbaa !307
  %272 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %271, i32 %268, i32 0, i32 %271) #6, !dbg !325, !srcloc !326
  store i32 %272, ptr %270, align 4, !dbg !325, !tbaa !307
  %273 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %272, i32 %258, i32 1, i32 %272) #6, !dbg !327, !srcloc !328
  store i32 %273, ptr %270, align 4, !dbg !327, !tbaa !307
  %274 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %273, i32 %264, i32 2, i32 %273) #6, !dbg !329, !srcloc !330
  store i32 %274, ptr %270, align 4, !dbg !329, !tbaa !307
  %275 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %274, i32 %266, i32 3, i32 %274) #6, !dbg !331, !srcloc !332
  store i32 %275, ptr %270, align 4, !dbg !331, !tbaa !307
  %276 = getelementptr inbounds nuw i8, ptr %261, i32 8, !dbg !333
  %277 = load i32, ptr %276, align 4, !dbg !334, !tbaa !307
  %278 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %277, i32 %266, i32 0, i32 %277) #6, !dbg !334, !srcloc !335
  store i32 %278, ptr %276, align 4, !dbg !334, !tbaa !307
  %279 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %278, i32 %268, i32 1, i32 %278) #6, !dbg !336, !srcloc !337
  store i32 %279, ptr %276, align 4, !dbg !336, !tbaa !307
  %280 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %279, i32 %258, i32 2, i32 %279) #6, !dbg !338, !srcloc !339
  store i32 %280, ptr %276, align 4, !dbg !338, !tbaa !307
  %281 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %280, i32 %264, i32 3, i32 %280) #6, !dbg !340, !srcloc !341
  store i32 %281, ptr %276, align 4, !dbg !340, !tbaa !307
  %282 = getelementptr inbounds nuw i8, ptr %261, i32 12, !dbg !342
  %283 = load i32, ptr %282, align 4, !dbg !343, !tbaa !307
  %284 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %283, i32 %264, i32 0, i32 %283) #6, !dbg !343, !srcloc !344
  store i32 %284, ptr %282, align 4, !dbg !343, !tbaa !307
  %285 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %284, i32 %266, i32 1, i32 %284) #6, !dbg !345, !srcloc !346
  store i32 %285, ptr %282, align 4, !dbg !345, !tbaa !307
  %286 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %285, i32 %268, i32 2, i32 %285) #6, !dbg !347, !srcloc !348
  store i32 %286, ptr %282, align 4, !dbg !347, !tbaa !307
  %287 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %286, i32 %258, i32 3, i32 %286) #6, !dbg !349, !srcloc !350
  store i32 %287, ptr %282, align 4, !dbg !349, !tbaa !307
  %288 = load i32, ptr %261, align 4, !dbg !351, !tbaa !307
  %289 = load i32, ptr %270, align 4, !dbg !352, !tbaa !307
  store i32 %289, ptr %19, align 4, !dbg !353, !tbaa !307
  %290 = load i32, ptr %276, align 4, !dbg !354, !tbaa !307
  store i32 %290, ptr %18, align 4, !dbg !355, !tbaa !307
  store i32 %287, ptr %17, align 4, !dbg !356, !tbaa !307
    #dbg_value(i32 0, !282, !DIExpression(), !309)
    #dbg_value(ptr %4, !288, !DIExpression(), !291)
    #dbg_value(ptr %1, !289, !DIExpression(), !291)
  %291 = load i32, ptr %1, align 4, !dbg !357, !tbaa !307
  %292 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %291, i32 %288, i32 0, i32 %291) #6, !dbg !357, !srcloc !358
  store i32 %292, ptr %1, align 4, !dbg !357, !tbaa !307
  %293 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %292, i32 %287, i32 1, i32 %292) #6, !dbg !359, !srcloc !360
  store i32 %293, ptr %1, align 4, !dbg !359, !tbaa !307
  %294 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %293, i32 %290, i32 2, i32 %293) #6, !dbg !361, !srcloc !362
  store i32 %294, ptr %1, align 4, !dbg !361, !tbaa !307
  %295 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %294, i32 %289, i32 3, i32 %294) #6, !dbg !363, !srcloc !364
  store i32 %295, ptr %1, align 4, !dbg !363, !tbaa !307
  %296 = getelementptr inbounds nuw i8, ptr %1, i32 4, !dbg !365
  %297 = load i32, ptr %296, align 4, !dbg !366, !tbaa !307
  %298 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %297, i32 %289, i32 0, i32 %297) #6, !dbg !366, !srcloc !367
  store i32 %298, ptr %296, align 4, !dbg !366, !tbaa !307
  %299 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %298, i32 %288, i32 1, i32 %298) #6, !dbg !368, !srcloc !369
  store i32 %299, ptr %296, align 4, !dbg !368, !tbaa !307
  %300 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %299, i32 %287, i32 2, i32 %299) #6, !dbg !370, !srcloc !371
  store i32 %300, ptr %296, align 4, !dbg !370, !tbaa !307
  %301 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %300, i32 %290, i32 3, i32 %300) #6, !dbg !372, !srcloc !373
  store i32 %301, ptr %296, align 4, !dbg !372, !tbaa !307
  %302 = getelementptr inbounds nuw i8, ptr %1, i32 8, !dbg !374
  %303 = load i32, ptr %302, align 4, !dbg !375, !tbaa !307
  %304 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %303, i32 %290, i32 0, i32 %303) #6, !dbg !375, !srcloc !376
  store i32 %304, ptr %302, align 4, !dbg !375, !tbaa !307
  %305 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %304, i32 %289, i32 1, i32 %304) #6, !dbg !377, !srcloc !378
  store i32 %305, ptr %302, align 4, !dbg !377, !tbaa !307
  %306 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %305, i32 %288, i32 2, i32 %305) #6, !dbg !379, !srcloc !380
  store i32 %306, ptr %302, align 4, !dbg !379, !tbaa !307
  %307 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %306, i32 %287, i32 3, i32 %306) #6, !dbg !381, !srcloc !382
  store i32 %307, ptr %302, align 4, !dbg !381, !tbaa !307
  %308 = getelementptr inbounds nuw i8, ptr %1, i32 12, !dbg !383
  %309 = load i32, ptr %308, align 4, !dbg !384, !tbaa !307
  %310 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %309, i32 %287, i32 0, i32 %309) #6, !dbg !384, !srcloc !385
  store i32 %310, ptr %308, align 4, !dbg !384, !tbaa !307
  %311 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %310, i32 %290, i32 1, i32 %310) #6, !dbg !386, !srcloc !387
  store i32 %311, ptr %308, align 4, !dbg !386, !tbaa !307
  %312 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %311, i32 %289, i32 2, i32 %311) #6, !dbg !388, !srcloc !389
  store i32 %312, ptr %308, align 4, !dbg !388, !tbaa !307
  %313 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %312, i32 %288, i32 3, i32 %312) #6, !dbg !390, !srcloc !391
  store i32 %313, ptr %308, align 4, !dbg !390, !tbaa !307
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %0, ptr noundef nonnull align 4 dereferenceable(16) %1, i32 16, i1 false), !dbg !392
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #6, !dbg !393
  ret void, !dbg !393
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #4

; Function Attrs: nounwind optsize
define dso_local void @aes128_ecb_decrypt(ptr nocapture noundef writeonly %0, i32 noundef %1, ptr nocapture noundef readonly %2, ptr nocapture noundef readonly %3) local_unnamed_addr #3 !dbg !394 {
  %5 = alloca [176 x i8], align 1, !DIAssignID !417
    #dbg_assign(i1 undef, !406, !DIExpression(), !417, ptr %5, !DIExpression(), !418)
  %6 = alloca [176 x i8], align 1, !DIAssignID !419
    #dbg_assign(i1 undef, !410, !DIExpression(), !419, ptr %6, !DIExpression(), !418)
    #dbg_value(ptr %0, !402, !DIExpression(), !418)
    #dbg_value(i32 %1, !403, !DIExpression(), !418)
    #dbg_value(ptr %2, !404, !DIExpression(), !418)
    #dbg_value(ptr %3, !405, !DIExpression(), !418)
  %7 = and i32 %1, 15, !dbg !420
  %8 = icmp eq i32 %7, 0, !dbg !422
  br i1 %8, label %9, label %18, !dbg !422

9:                                                ; preds = %4
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %5) #6, !dbg !423
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %6) #6, !dbg !424
  call void @expand_key(ptr noundef %2, ptr noundef nonnull %5) #7, !dbg !425
    #dbg_value(i32 0, !411, !DIExpression(), !426)
  %10 = icmp eq i32 %1, 0, !dbg !427
  br i1 %10, label %17, label %.preheader, !dbg !428

.preheader:                                       ; preds = %9
  br label %11, !dbg !428

11:                                               ; preds = %.preheader, %11
  %12 = phi i32 [ %15, %11 ], [ 0, %.preheader ]
    #dbg_value(i32 %12, !411, !DIExpression(), !426)
    #dbg_value(i32 0, !413, !DIExpression(), !429)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(176) %6, ptr noundef nonnull align 1 dereferenceable(176) %5, i32 176, i1 false), !dbg !430, !tbaa !109
    #dbg_value(i32 poison, !413, !DIExpression(), !429)
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 %12, !dbg !433
  %14 = getelementptr inbounds nuw i8, ptr %3, i32 %12, !dbg !434
  call void @aes128_decrypt_block(ptr noundef %13, ptr noundef nonnull %6, ptr noundef %14) #7, !dbg !435
  %15 = add i32 %12, 16, !dbg !436
    #dbg_value(i32 %15, !411, !DIExpression(), !426)
  %16 = icmp ult i32 %15, %1, !dbg !427
  br i1 %16, label %11, label %.loopexit, !dbg !428, !llvm.loop !437

.loopexit:                                        ; preds = %11
  br label %17, !dbg !439

17:                                               ; preds = %.loopexit, %9
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %6) #6, !dbg !439
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %5) #6, !dbg !439
  br label %18, !dbg !439

18:                                               ; preds = %17, %4
  ret void, !dbg !439
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_to_address(i32 noundef %0, i32 noundef %1) local_unnamed_addr #5 !dbg !440 {
    #dbg_value(i32 %0, !446, !DIExpression(), !448)
    #dbg_value(i32 %1, !447, !DIExpression(), !448)
  %3 = inttoptr i32 %0 to ptr, !dbg !449
  store volatile i32 %1, ptr %3, align 4, !dbg !450, !tbaa !307
  ret void, !dbg !451
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_v_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #5 !dbg !452 {
    #dbg_value(i32 %0, !456, !DIExpression(), !461)
    #dbg_value(ptr %1, !457, !DIExpression(), !461)
    #dbg_value(ptr %1, !458, !DIExpression(), !461)
    #dbg_value(i32 0, !459, !DIExpression(), !462)
  br label %4, !dbg !463

3:                                                ; preds = %4
  ret void, !dbg !464

4:                                                ; preds = %4, %2
  %5 = phi i32 [ 0, %2 ], [ %11, %4 ]
    #dbg_value(i32 %5, !459, !DIExpression(), !462)
  %6 = shl nuw nsw i32 %5, 2, !dbg !465
  %7 = add i32 %6, %0, !dbg !468
  %8 = getelementptr inbounds nuw i32, ptr %1, i32 %5, !dbg !469
  %9 = load i32, ptr %8, align 4, !dbg !469, !tbaa !307
    #dbg_value(i32 %7, !446, !DIExpression(), !470)
    #dbg_value(i32 %9, !447, !DIExpression(), !470)
  %10 = inttoptr i32 %7 to ptr, !dbg !472
  store volatile i32 %9, ptr %10, align 4, !dbg !473, !tbaa !307
  %11 = add nuw nsw i32 %5, 1, !dbg !474
    #dbg_value(i32 %11, !459, !DIExpression(), !462)
  %12 = icmp eq i32 %11, 4, !dbg !475
  br i1 %12, label %3, label %4, !dbg !463, !llvm.loop !476
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_numb_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #5 !dbg !478 {
    #dbg_value(i32 %0, !480, !DIExpression(), !483)
    #dbg_value(ptr %1, !481, !DIExpression(), !483)
    #dbg_value(ptr %1, !482, !DIExpression(), !483)
  %3 = load i32, ptr %1, align 4, !dbg !484, !tbaa !307
    #dbg_value(i32 %0, !446, !DIExpression(), !485)
    #dbg_value(i32 %3, !447, !DIExpression(), !485)
  %4 = inttoptr i32 %0 to ptr, !dbg !487
  store volatile i32 %3, ptr %4, align 4, !dbg !488, !tbaa !307
  ret void, !dbg !489
}

; Function Attrs: nounwind optsize
define dso_local noundef i32 @main() local_unnamed_addr #3 !dbg !490 {
    #dbg_assign(i1 undef, !494, !DIExpression(), !503, ptr @__const.main.ciphertext, !DIExpression(), !504)
    #dbg_assign(i1 undef, !495, !DIExpression(), !505, ptr @__const.main.key, !DIExpression(), !504)
    #dbg_assign(i1 undef, !496, !DIExpression(), !506, ptr @__const.main.expected_output, !DIExpression(), !504)
  %1 = alloca [16 x i8], align 1, !DIAssignID !507
    #dbg_assign(i1 undef, !497, !DIExpression(), !507, ptr %1, !DIExpression(), !504)
    #dbg_assign(i1 undef, !494, !DIExpression(), !508, ptr @__const.main.ciphertext, !DIExpression(), !504)
    #dbg_assign(i1 undef, !495, !DIExpression(), !509, ptr @__const.main.key, !DIExpression(), !504)
    #dbg_assign(i1 undef, !496, !DIExpression(), !510, ptr @__const.main.expected_output, !DIExpression(), !504)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #6, !dbg !511
    #dbg_value(i32 16, !498, !DIExpression(), !504)
  call void @aes128_ecb_decrypt(ptr noundef nonnull %1, i32 noundef 16, ptr noundef nonnull @__const.main.key, ptr noundef nonnull @__const.main.ciphertext) #7, !dbg !512
    #dbg_value(i32 1056816, !499, !DIExpression(), !504)
    #dbg_value(i32 1056816, !456, !DIExpression(), !513)
    #dbg_value(ptr @__const.main.expected_output, !457, !DIExpression(), !513)
    #dbg_value(ptr @__const.main.expected_output, !458, !DIExpression(), !513)
    #dbg_value(i32 0, !459, !DIExpression(), !515)
    #dbg_value(i32 0, !459, !DIExpression(), !515)
    #dbg_value(i32 1056816, !446, !DIExpression(), !516)
    #dbg_value(i32 1819043144, !447, !DIExpression(), !516)
  store volatile i32 1819043144, ptr inttoptr (i32 1056816 to ptr), align 16, !dbg !518, !tbaa !307
    #dbg_value(i32 1, !459, !DIExpression(), !515)
    #dbg_value(i32 1056820, !446, !DIExpression(), !516)
    #dbg_value(i32 1461726319, !447, !DIExpression(), !516)
  store volatile i32 1461726319, ptr inttoptr (i32 1056820 to ptr), align 4, !dbg !518, !tbaa !307
    #dbg_value(i32 2, !459, !DIExpression(), !515)
    #dbg_value(i32 1056824, !446, !DIExpression(), !516)
    #dbg_value(i32 1684828783, !447, !DIExpression(), !516)
  store volatile i32 1684828783, ptr inttoptr (i32 1056824 to ptr), align 8, !dbg !518, !tbaa !307
    #dbg_value(i32 3, !459, !DIExpression(), !515)
    #dbg_value(i32 1056828, !446, !DIExpression(), !516)
    #dbg_value(i32 808464417, !447, !DIExpression(), !516)
  store volatile i32 808464417, ptr inttoptr (i32 1056828 to ptr), align 4, !dbg !518, !tbaa !307
    #dbg_value(i32 4, !459, !DIExpression(), !515)
    #dbg_value(i32 0, !459, !DIExpression(), !519)
  %2 = load i32, ptr %1, align 4, !dbg !521, !tbaa !307
    #dbg_value(i32 1056832, !446, !DIExpression(), !522)
    #dbg_value(i32 %2, !447, !DIExpression(), !522)
  store volatile i32 %2, ptr inttoptr (i32 1056832 to ptr), align 64, !dbg !524, !tbaa !307
    #dbg_value(i32 1, !459, !DIExpression(), !519)
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 4, !dbg !521
  %4 = load i32, ptr %3, align 4, !dbg !521, !tbaa !307
    #dbg_value(i32 1056836, !446, !DIExpression(), !522)
    #dbg_value(i32 %4, !447, !DIExpression(), !522)
  store volatile i32 %4, ptr inttoptr (i32 1056836 to ptr), align 4, !dbg !524, !tbaa !307
    #dbg_value(i32 2, !459, !DIExpression(), !519)
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 8, !dbg !521
  %6 = load i32, ptr %5, align 4, !dbg !521, !tbaa !307
    #dbg_value(i32 1056840, !446, !DIExpression(), !522)
    #dbg_value(i32 %6, !447, !DIExpression(), !522)
  store volatile i32 %6, ptr inttoptr (i32 1056840 to ptr), align 8, !dbg !524, !tbaa !307
    #dbg_value(i32 3, !459, !DIExpression(), !519)
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 12, !dbg !521
  %8 = load i32, ptr %7, align 4, !dbg !521, !tbaa !307
    #dbg_value(i32 1056844, !446, !DIExpression(), !522)
    #dbg_value(i32 %8, !447, !DIExpression(), !522)
  store volatile i32 %8, ptr inttoptr (i32 1056844 to ptr), align 4, !dbg !524, !tbaa !307
    #dbg_value(i32 4, !459, !DIExpression(), !519)
  br label %12, !dbg !525

9:                                                ; preds = %12
  %10 = add nuw nsw i32 %13, 1, !dbg !526
    #dbg_value(i32 %10, !501, !DIExpression(), !528)
    #dbg_value(i32 %10, !501, !DIExpression(), !528)
  %11 = icmp eq i32 %10, 16, !dbg !529
  br i1 %11, label %19, label %12, !dbg !525, !llvm.loop !530

12:                                               ; preds = %9, %0
  %13 = phi i32 [ %10, %9 ], [ 0, %0 ]
    #dbg_value(i32 %13, !501, !DIExpression(), !528)
  %14 = getelementptr inbounds nuw [16 x i8], ptr %1, i32 0, i32 %13, !dbg !532
  %15 = load i8, ptr %14, align 1, !dbg !532, !tbaa !109
  %16 = getelementptr inbounds nuw [16 x i8], ptr @__const.main.expected_output, i32 0, i32 %13, !dbg !535
  %17 = load i8, ptr %16, align 1, !dbg !535, !tbaa !109
  %18 = icmp eq i8 %15, %17, !dbg !536
    #dbg_value(i32 %13, !501, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !528)
  br i1 %18, label %9, label %19, !dbg !536

19:                                               ; preds = %12, %9
  %20 = phi i32 [ -889275714, %9 ], [ -1163220307, %12 ], !dbg !504
    #dbg_value(i32 %20, !500, !DIExpression(), !504)
    #dbg_value(i32 1056772, !446, !DIExpression(), !537)
    #dbg_value(i32 %20, !447, !DIExpression(), !537)
  store volatile i32 %20, ptr inttoptr (i32 1056772 to ptr), align 4, !dbg !539, !tbaa !307
    #dbg_value(i32 1056768, !499, !DIExpression(), !504)
    #dbg_value(i32 -559038737, !500, !DIExpression(), !504)
    #dbg_value(i32 1056768, !446, !DIExpression(), !540)
    #dbg_value(i32 -559038737, !447, !DIExpression(), !540)
  store volatile i32 -559038737, ptr inttoptr (i32 1056768 to ptr), align 8192, !dbg !542, !tbaa !307
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #6, !dbg !543
  ret i32 0, !dbg !543
}

attributes #0 = { nofree norecurse nosync nounwind optsize memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zknd,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zknd,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zknd,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nofree norecurse nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zknd,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { nounwind }
attributes #7 = { optsize }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!31, !32, !33, !34, !35, !37, !38}
!llvm.ident = !{!39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "sbox", scope: !2, file: !3, line: 6, type: !28, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.8 (++20250804090239+87f0227cb601-1~exp1~20250804210352.139)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "main_d.c", directory: "/home/borislav/Documents/pdp-project-29/software", checksumkind: CSK_MD5, checksum: "099a240e23e1d67433f0a3fe8b85128b")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 32)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !7, line: 48, baseType: !8)
!7 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/sys/_stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "ab914e287601b2385e57880e6599aa6b")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 79, baseType: !10)
!9 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/machine/_default_types.h", directory: "", checksumkind: CSK_MD5, checksum: "f7024d0682a918b41f94e8be9cd90461")
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!13 = !{!0, !14, !23}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "rcon", scope: !2, file: !3, line: 31, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!17 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !7, line: 24, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "inv_matrix", scope: !2, file: !3, line: 34, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 128, elements: !26)
!26 = !{!27, !27}
!27 = !DISubrange(count: 4)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 2048, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 256)
!31 = !{i32 7, !"Dwarf Version", i32 5}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{i32 1, !"target-abi", !"ilp32"}
!35 = !{i32 6, !"riscv-isa", !36}
!36 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zknd1p0"}
!37 = !{i32 8, !"SmallDataLimit", i32 8}
!38 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!39 = !{!"Ubuntu clang version 20.1.8 (++20250804090239+87f0227cb601-1~exp1~20250804210352.139)"}
!40 = distinct !DISubprogram(name: "gf_mult", scope: !3, file: !3, line: 40, type: !41, scopeLine: 40, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !43)
!41 = !DISubroutineType(types: !42)
!42 = !{!18, !18, !18}
!43 = !{!44, !45, !46, !47, !50}
!44 = !DILocalVariable(name: "a", arg: 1, scope: !40, file: !3, line: 40, type: !18)
!45 = !DILocalVariable(name: "b", arg: 2, scope: !40, file: !3, line: 40, type: !18)
!46 = !DILocalVariable(name: "p", scope: !40, file: !3, line: 41, type: !18)
!47 = !DILocalVariable(name: "i", scope: !48, file: !3, line: 42, type: !49)
!48 = distinct !DILexicalBlock(scope: !40, file: !3, line: 42, column: 3)
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DILocalVariable(name: "hi_bit", scope: !51, file: !3, line: 45, type: !18)
!51 = distinct !DILexicalBlock(scope: !52, file: !3, line: 42, column: 31)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 42, column: 3)
!53 = !DILocation(line: 0, scope: !40)
!54 = !DILocation(line: 0, scope: !48)
!55 = !DILocation(line: 42, column: 3, scope: !48)
!56 = !DILocation(line: 43, column: 11, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !3, line: 43, column: 9)
!58 = !DILocation(line: 51, column: 3, scope: !40)
!59 = !DILocation(line: 0, scope: !51)
!60 = !DILocation(line: 46, column: 7, scope: !51)
!61 = !DILocation(line: 47, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !51, file: !3, line: 47, column: 9)
!63 = !DILocation(line: 49, column: 7, scope: !51)
!64 = !DILocation(line: 42, column: 27, scope: !52)
!65 = !DILocation(line: 42, column: 21, scope: !52)
!66 = distinct !{!66, !55, !67, !68}
!67 = !DILocation(line: 50, column: 3, scope: !48)
!68 = !{!"llvm.loop.mustprogress"}
!69 = distinct !DISubprogram(name: "expand_key", scope: !3, file: !3, line: 55, type: !70, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !73)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !72, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 32)
!73 = !{!74, !75, !76, !77, !83, !86, !90, !93, !95, !98, !99, !100, !101}
!74 = !DILocalVariable(name: "key", arg: 1, scope: !69, file: !3, line: 55, type: !72)
!75 = !DILocalVariable(name: "round_keys", arg: 2, scope: !69, file: !3, line: 55, type: !72)
!76 = !DILocalVariable(name: "i", scope: !69, file: !3, line: 56, type: !49)
!77 = !DILocalVariable(name: "temp", scope: !78, file: !3, line: 61, type: !81)
!78 = distinct !DILexicalBlock(scope: !79, file: !3, line: 60, column: 33)
!79 = distinct !DILexicalBlock(scope: !80, file: !3, line: 60, column: 3)
!80 = distinct !DILexicalBlock(scope: !69, file: !3, line: 60, column: 3)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !82)
!82 = !{!27}
!83 = !DILocalVariable(name: "t", scope: !84, file: !3, line: 67, type: !18)
!84 = distinct !DILexicalBlock(scope: !85, file: !3, line: 66, column: 22)
!85 = distinct !DILexicalBlock(scope: !78, file: !3, line: 66, column: 9)
!86 = !DILocalVariable(name: "z", scope: !87, file: !3, line: 80, type: !88)
!87 = distinct !DILexicalBlock(scope: !69, file: !3, line: 80, column: 3)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 44, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 77, baseType: !49)
!90 = !DILocalVariable(name: "keys", scope: !91, file: !3, line: 81, type: !72)
!91 = distinct !DILexicalBlock(scope: !92, file: !3, line: 80, column: 42)
!92 = distinct !DILexicalBlock(scope: !87, file: !3, line: 80, column: 3)
!93 = !DILocalVariable(name: "col", scope: !94, file: !3, line: 82, type: !88)
!94 = distinct !DILexicalBlock(scope: !91, file: !3, line: 82, column: 5)
!95 = !DILocalVariable(name: "c0", scope: !96, file: !3, line: 83, type: !18)
!96 = distinct !DILexicalBlock(scope: !97, file: !3, line: 82, column: 43)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 82, column: 5)
!98 = !DILocalVariable(name: "c1", scope: !96, file: !3, line: 83, type: !18)
!99 = !DILocalVariable(name: "c2", scope: !96, file: !3, line: 84, type: !18)
!100 = !DILocalVariable(name: "c3", scope: !96, file: !3, line: 84, type: !18)
!101 = !DILocalVariable(name: "row", scope: !102, file: !3, line: 85, type: !88)
!102 = distinct !DILexicalBlock(scope: !96, file: !3, line: 85, column: 7)
!103 = !DILocation(line: 0, scope: !69)
!104 = !DILocation(line: 57, column: 3, scope: !105)
!105 = distinct !DILexicalBlock(scope: !69, file: !3, line: 57, column: 3)
!106 = !DILocation(line: 58, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !3, line: 57, column: 28)
!108 = distinct !DILexicalBlock(scope: !105, file: !3, line: 57, column: 3)
!109 = !{!110, !110, i64 0}
!110 = !{!"omnipotent char", !111, i64 0}
!111 = !{!"Simple C/C++ TBAA"}
!112 = !DILocation(line: 58, column: 5, scope: !107)
!113 = !DILocation(line: 58, column: 19, scope: !107)
!114 = !DILocation(line: 57, column: 24, scope: !108)
!115 = !DILocation(line: 57, column: 17, scope: !108)
!116 = distinct !{!116, !104, !117, !68}
!117 = !DILocation(line: 59, column: 3, scope: !105)
!118 = !DILocation(line: 60, column: 3, scope: !80)
!119 = !DILocation(line: 62, column: 15, scope: !78)
!120 = !DILocation(line: 0, scope: !78)
!121 = !DILocation(line: 63, column: 15, scope: !78)
!122 = !DILocation(line: 64, column: 15, scope: !78)
!123 = !DILocation(line: 65, column: 15, scope: !78)
!124 = !DILocation(line: 66, column: 11, scope: !85)
!125 = !DILocation(line: 66, column: 16, scope: !85)
!126 = !DILocation(line: 0, scope: !84)
!127 = !DILocation(line: 68, column: 17, scope: !84)
!128 = !DILocation(line: 69, column: 17, scope: !84)
!129 = !DILocation(line: 70, column: 17, scope: !84)
!130 = !DILocation(line: 71, column: 17, scope: !84)
!131 = !DILocation(line: 72, column: 26, scope: !84)
!132 = !DILocation(line: 72, column: 32, scope: !84)
!133 = !DILocation(line: 72, column: 18, scope: !84)
!134 = !DILocation(line: 72, column: 15, scope: !84)
!135 = !DILocation(line: 73, column: 5, scope: !84)
!136 = !DILocation(line: 74, column: 21, scope: !78)
!137 = !DILocation(line: 74, column: 40, scope: !78)
!138 = !DILocation(line: 74, column: 19, scope: !78)
!139 = !DILocation(line: 75, column: 25, scope: !78)
!140 = !DILocation(line: 75, column: 44, scope: !78)
!141 = !DILocation(line: 75, column: 18, scope: !78)
!142 = !DILocation(line: 75, column: 5, scope: !78)
!143 = !DILocation(line: 75, column: 23, scope: !78)
!144 = !DILocation(line: 76, column: 25, scope: !78)
!145 = !DILocation(line: 76, column: 44, scope: !78)
!146 = !DILocation(line: 76, column: 18, scope: !78)
!147 = !DILocation(line: 76, column: 5, scope: !78)
!148 = !DILocation(line: 76, column: 23, scope: !78)
!149 = !DILocation(line: 77, column: 25, scope: !78)
!150 = !DILocation(line: 77, column: 44, scope: !78)
!151 = !DILocation(line: 77, column: 18, scope: !78)
!152 = !DILocation(line: 77, column: 5, scope: !78)
!153 = !DILocation(line: 77, column: 23, scope: !78)
!154 = !DILocation(line: 60, column: 27, scope: !79)
!155 = !DILocation(line: 60, column: 18, scope: !79)
!156 = distinct !{!156, !118, !157, !68}
!157 = !DILocation(line: 78, column: 3, scope: !80)
!158 = !DILocation(line: 80, column: 3, scope: !87)
!159 = !DILocation(line: 92, column: 1, scope: !69)
!160 = !DILocation(line: 0, scope: !87)
!161 = !DILocation(line: 81, column: 22, scope: !91)
!162 = !DILocation(line: 0, scope: !91)
!163 = !DILocation(line: 0, scope: !94)
!164 = !DILocation(line: 82, column: 5, scope: !94)
!165 = !DILocation(line: 80, column: 35, scope: !92)
!166 = !DILocation(line: 80, column: 26, scope: !92)
!167 = distinct !{!167, !158, !168, !68}
!168 = !DILocation(line: 91, column: 3, scope: !87)
!169 = !DILocation(line: 83, column: 29, scope: !96)
!170 = !DILocation(line: 83, column: 20, scope: !96)
!171 = !DILocation(line: 0, scope: !96)
!172 = !DILocation(line: 83, column: 57, scope: !96)
!173 = !DILocation(line: 83, column: 44, scope: !96)
!174 = !DILocation(line: 84, column: 33, scope: !96)
!175 = !DILocation(line: 84, column: 20, scope: !96)
!176 = !DILocation(line: 84, column: 57, scope: !96)
!177 = !DILocation(line: 84, column: 44, scope: !96)
!178 = !DILocation(line: 0, scope: !102)
!179 = !DILocation(line: 85, column: 7, scope: !102)
!180 = !DILocation(line: 82, column: 39, scope: !97)
!181 = !DILocation(line: 82, column: 31, scope: !97)
!182 = distinct !{!182, !164, !183, !68}
!183 = !DILocation(line: 90, column: 5, scope: !94)
!184 = !DILocation(line: 87, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !3, line: 85, column: 45)
!186 = distinct !DILexicalBlock(scope: !102, file: !3, line: 85, column: 7)
!187 = !DILocation(line: 0, scope: !40, inlinedAt: !188)
!188 = distinct !DILocation(line: 87, column: 13, scope: !185)
!189 = !DILocation(line: 0, scope: !48, inlinedAt: !188)
!190 = !DILocation(line: 42, column: 3, scope: !48, inlinedAt: !188)
!191 = !DILocation(line: 43, column: 11, scope: !57, inlinedAt: !188)
!192 = !DILocation(line: 0, scope: !51, inlinedAt: !188)
!193 = !DILocation(line: 46, column: 7, scope: !51, inlinedAt: !188)
!194 = !DILocation(line: 47, column: 9, scope: !62, inlinedAt: !188)
!195 = !DILocation(line: 49, column: 7, scope: !51, inlinedAt: !188)
!196 = !DILocation(line: 42, column: 27, scope: !52, inlinedAt: !188)
!197 = !DILocation(line: 42, column: 21, scope: !52, inlinedAt: !188)
!198 = distinct !{!198, !190, !199, !68}
!199 = !DILocation(line: 50, column: 3, scope: !48, inlinedAt: !188)
!200 = !DILocation(line: 87, column: 55, scope: !185)
!201 = !DILocation(line: 0, scope: !40, inlinedAt: !202)
!202 = distinct !DILocation(line: 87, column: 47, scope: !185)
!203 = !DILocation(line: 0, scope: !48, inlinedAt: !202)
!204 = !DILocation(line: 42, column: 3, scope: !48, inlinedAt: !202)
!205 = !DILocation(line: 43, column: 11, scope: !57, inlinedAt: !202)
!206 = !DILocation(line: 0, scope: !51, inlinedAt: !202)
!207 = !DILocation(line: 46, column: 7, scope: !51, inlinedAt: !202)
!208 = !DILocation(line: 47, column: 9, scope: !62, inlinedAt: !202)
!209 = !DILocation(line: 49, column: 7, scope: !51, inlinedAt: !202)
!210 = !DILocation(line: 42, column: 27, scope: !52, inlinedAt: !202)
!211 = !DILocation(line: 42, column: 21, scope: !52, inlinedAt: !202)
!212 = distinct !{!212, !204, !213, !68}
!213 = !DILocation(line: 50, column: 3, scope: !48, inlinedAt: !202)
!214 = !DILocation(line: 88, column: 21, scope: !185)
!215 = !DILocation(line: 0, scope: !40, inlinedAt: !216)
!216 = distinct !DILocation(line: 88, column: 13, scope: !185)
!217 = !DILocation(line: 0, scope: !48, inlinedAt: !216)
!218 = !DILocation(line: 42, column: 3, scope: !48, inlinedAt: !216)
!219 = !DILocation(line: 43, column: 11, scope: !57, inlinedAt: !216)
!220 = !DILocation(line: 0, scope: !51, inlinedAt: !216)
!221 = !DILocation(line: 46, column: 7, scope: !51, inlinedAt: !216)
!222 = !DILocation(line: 47, column: 9, scope: !62, inlinedAt: !216)
!223 = !DILocation(line: 49, column: 7, scope: !51, inlinedAt: !216)
!224 = !DILocation(line: 42, column: 27, scope: !52, inlinedAt: !216)
!225 = !DILocation(line: 42, column: 21, scope: !52, inlinedAt: !216)
!226 = distinct !{!226, !218, !227, !68}
!227 = !DILocation(line: 50, column: 3, scope: !48, inlinedAt: !216)
!228 = !DILocation(line: 87, column: 45, scope: !185)
!229 = !DILocation(line: 88, column: 55, scope: !185)
!230 = !DILocation(line: 0, scope: !40, inlinedAt: !231)
!231 = distinct !DILocation(line: 88, column: 47, scope: !185)
!232 = !DILocation(line: 0, scope: !48, inlinedAt: !231)
!233 = !DILocation(line: 42, column: 3, scope: !48, inlinedAt: !231)
!234 = !DILocation(line: 43, column: 11, scope: !57, inlinedAt: !231)
!235 = !DILocation(line: 0, scope: !51, inlinedAt: !231)
!236 = !DILocation(line: 46, column: 7, scope: !51, inlinedAt: !231)
!237 = !DILocation(line: 47, column: 9, scope: !62, inlinedAt: !231)
!238 = !DILocation(line: 49, column: 7, scope: !51, inlinedAt: !231)
!239 = !DILocation(line: 42, column: 27, scope: !52, inlinedAt: !231)
!240 = !DILocation(line: 42, column: 21, scope: !52, inlinedAt: !231)
!241 = distinct !{!241, !233, !242, !68}
!242 = !DILocation(line: 50, column: 3, scope: !48, inlinedAt: !231)
!243 = !DILocation(line: 87, column: 79, scope: !185)
!244 = !DILocation(line: 88, column: 45, scope: !185)
!245 = !DILocation(line: 86, column: 22, scope: !185)
!246 = !DILocation(line: 86, column: 9, scope: !185)
!247 = !DILocation(line: 86, column: 29, scope: !185)
!248 = !DILocation(line: 85, column: 41, scope: !186)
!249 = !DILocation(line: 85, column: 33, scope: !186)
!250 = distinct !{!250, !179, !251, !68}
!251 = !DILocation(line: 89, column: 7, scope: !102)
!252 = distinct !DISubprogram(name: "add_round_key", scope: !3, file: !3, line: 144, type: !70, scopeLine: 144, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !253)
!253 = !{!254, !255, !256}
!254 = !DILocalVariable(name: "state", arg: 1, scope: !252, file: !3, line: 144, type: !72)
!255 = !DILocalVariable(name: "round_key", arg: 2, scope: !252, file: !3, line: 144, type: !72)
!256 = !DILocalVariable(name: "i", scope: !257, file: !3, line: 145, type: !49)
!257 = distinct !DILexicalBlock(scope: !252, file: !3, line: 145, column: 3)
!258 = !DILocation(line: 0, scope: !252)
!259 = !DILocation(line: 0, scope: !257)
!260 = !DILocation(line: 145, column: 3, scope: !257)
!261 = !DILocation(line: 148, column: 1, scope: !252)
!262 = !DILocation(line: 146, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !264, file: !3, line: 145, column: 32)
!264 = distinct !DILexicalBlock(scope: !257, file: !3, line: 145, column: 3)
!265 = !DILocation(line: 146, column: 5, scope: !263)
!266 = !DILocation(line: 146, column: 14, scope: !263)
!267 = !DILocation(line: 145, column: 28, scope: !264)
!268 = !DILocation(line: 145, column: 21, scope: !264)
!269 = distinct !{!269, !260, !270, !68}
!270 = !DILocation(line: 147, column: 3, scope: !257)
!271 = distinct !DISubprogram(name: "aes128_decrypt_block", scope: !3, file: !3, line: 151, type: !272, scopeLine: 152, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !274)
!272 = !DISubroutineType(types: !273)
!273 = !{null, !72, !72, !72}
!274 = !{!275, !276, !277, !278, !282, !284, !287, !288, !289}
!275 = !DILocalVariable(name: "plaintext", arg: 1, scope: !271, file: !3, line: 151, type: !72)
!276 = !DILocalVariable(name: "round_keys", arg: 2, scope: !271, file: !3, line: 151, type: !72)
!277 = !DILocalVariable(name: "ciphertext", arg: 3, scope: !271, file: !3, line: 152, type: !72)
!278 = !DILocalVariable(name: "state", scope: !271, file: !3, line: 153, type: !279)
!279 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 128, elements: !280)
!280 = !{!281}
!281 = !DISubrange(count: 16)
!282 = !DILocalVariable(name: "round", scope: !283, file: !3, line: 161, type: !49)
!283 = distinct !DILexicalBlock(scope: !271, file: !3, line: 161, column: 3)
!284 = !DILocalVariable(name: "state_ptr", scope: !285, file: !3, line: 162, type: !5)
!285 = distinct !DILexicalBlock(scope: !286, file: !3, line: 161, column: 44)
!286 = distinct !DILexicalBlock(scope: !283, file: !3, line: 161, column: 3)
!287 = !DILocalVariable(name: "round_key_ptr", scope: !285, file: !3, line: 163, type: !5)
!288 = !DILocalVariable(name: "final_state_ptr", scope: !271, file: !3, line: 224, type: !5)
!289 = !DILocalVariable(name: "final_round_key_ptr", scope: !271, file: !3, line: 225, type: !5)
!290 = distinct !DIAssignID()
!291 = !DILocation(line: 0, scope: !271)
!292 = !DILocation(line: 153, column: 3, scope: !271)
!293 = !DILocation(line: 154, column: 3, scope: !271)
!294 = distinct !DIAssignID()
!295 = !DILocation(line: 157, column: 25, scope: !271)
!296 = !DILocation(line: 0, scope: !252, inlinedAt: !297)
!297 = distinct !DILocation(line: 157, column: 3, scope: !271)
!298 = !DILocation(line: 0, scope: !257, inlinedAt: !297)
!299 = !DILocation(line: 145, column: 3, scope: !257, inlinedAt: !297)
!300 = !DILocation(line: 146, column: 17, scope: !263, inlinedAt: !297)
!301 = !DILocation(line: 146, column: 5, scope: !263, inlinedAt: !297)
!302 = !DILocation(line: 146, column: 14, scope: !263, inlinedAt: !297)
!303 = !DILocation(line: 145, column: 28, scope: !264, inlinedAt: !297)
!304 = !DILocation(line: 145, column: 21, scope: !264, inlinedAt: !297)
!305 = distinct !{!305, !299, !306, !68}
!306 = !DILocation(line: 147, column: 3, scope: !257, inlinedAt: !297)
!307 = !{!308, !308, i64 0}
!308 = !{!"int", !110, i64 0}
!309 = !DILocation(line: 0, scope: !283)
!310 = !DILocation(line: 161, column: 3, scope: !283)
!311 = !DILocation(line: 0, scope: !285)
!312 = !DILocation(line: 163, column: 44, scope: !285)
!313 = !DILocation(line: 165, column: 5, scope: !285)
!314 = !{i64 6135}
!315 = !DILocation(line: 170, column: 51, scope: !285)
!316 = !DILocation(line: 168, column: 5, scope: !285)
!317 = !{i64 6306}
!318 = !DILocation(line: 173, column: 51, scope: !285)
!319 = !DILocation(line: 171, column: 5, scope: !285)
!320 = !{i64 6477}
!321 = !DILocation(line: 176, column: 51, scope: !285)
!322 = !DILocation(line: 174, column: 5, scope: !285)
!323 = !{i64 6648}
!324 = !DILocation(line: 179, column: 29, scope: !285)
!325 = !DILocation(line: 178, column: 5, scope: !285)
!326 = !{i64 6821}
!327 = !DILocation(line: 181, column: 5, scope: !285)
!328 = !{i64 6992}
!329 = !DILocation(line: 184, column: 5, scope: !285)
!330 = !{i64 7163}
!331 = !DILocation(line: 187, column: 5, scope: !285)
!332 = !{i64 7334}
!333 = !DILocation(line: 192, column: 29, scope: !285)
!334 = !DILocation(line: 191, column: 5, scope: !285)
!335 = !{i64 7507}
!336 = !DILocation(line: 194, column: 5, scope: !285)
!337 = !{i64 7678}
!338 = !DILocation(line: 197, column: 5, scope: !285)
!339 = !{i64 7849}
!340 = !DILocation(line: 200, column: 5, scope: !285)
!341 = !{i64 8020}
!342 = !DILocation(line: 205, column: 29, scope: !285)
!343 = !DILocation(line: 204, column: 5, scope: !285)
!344 = !{i64 8193}
!345 = !DILocation(line: 207, column: 5, scope: !285)
!346 = !{i64 8364}
!347 = !DILocation(line: 210, column: 5, scope: !285)
!348 = !{i64 8535}
!349 = !DILocation(line: 213, column: 5, scope: !285)
!350 = !{i64 8706}
!351 = !DILocation(line: 217, column: 20, scope: !285)
!352 = !DILocation(line: 218, column: 20, scope: !285)
!353 = !DILocation(line: 218, column: 18, scope: !285)
!354 = !DILocation(line: 219, column: 20, scope: !285)
!355 = !DILocation(line: 219, column: 18, scope: !285)
!356 = !DILocation(line: 220, column: 18, scope: !285)
!357 = !DILocation(line: 228, column: 3, scope: !271)
!358 = !{i64 9352}
!359 = !DILocation(line: 232, column: 3, scope: !271)
!360 = !{i64 9556}
!361 = !DILocation(line: 236, column: 3, scope: !271)
!362 = !{i64 9760}
!363 = !DILocation(line: 240, column: 3, scope: !271)
!364 = !{i64 9964}
!365 = !DILocation(line: 246, column: 27, scope: !271)
!366 = !DILocation(line: 245, column: 3, scope: !271)
!367 = !{i64 10170}
!368 = !DILocation(line: 249, column: 3, scope: !271)
!369 = !{i64 10374}
!370 = !DILocation(line: 253, column: 3, scope: !271)
!371 = !{i64 10578}
!372 = !DILocation(line: 257, column: 3, scope: !271)
!373 = !{i64 10782}
!374 = !DILocation(line: 263, column: 27, scope: !271)
!375 = !DILocation(line: 262, column: 3, scope: !271)
!376 = !{i64 10988}
!377 = !DILocation(line: 266, column: 3, scope: !271)
!378 = !{i64 11192}
!379 = !DILocation(line: 270, column: 3, scope: !271)
!380 = !{i64 11396}
!381 = !DILocation(line: 274, column: 3, scope: !271)
!382 = !{i64 11600}
!383 = !DILocation(line: 280, column: 27, scope: !271)
!384 = !DILocation(line: 279, column: 3, scope: !271)
!385 = !{i64 11806}
!386 = !DILocation(line: 283, column: 3, scope: !271)
!387 = !{i64 12010}
!388 = !DILocation(line: 287, column: 3, scope: !271)
!389 = !{i64 12214}
!390 = !DILocation(line: 291, column: 3, scope: !271)
!391 = !{i64 12418}
!392 = !DILocation(line: 296, column: 3, scope: !271)
!393 = !DILocation(line: 297, column: 1, scope: !271)
!394 = distinct !DISubprogram(name: "aes128_ecb_decrypt", scope: !3, file: !3, line: 300, type: !395, scopeLine: 301, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !401)
!395 = !DISubroutineType(types: !396)
!396 = !{null, !72, !397, !72, !72}
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !398, line: 40, baseType: !399)
!398 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/strings.h", directory: "", checksumkind: CSK_MD5, checksum: "dceb1b71cd72987b246237af8552faba")
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "__size_t", file: !400, line: 131, baseType: !10)
!400 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "17b5691773b3e3881dfdbe392c9e8d43")
!401 = !{!402, !403, !404, !405, !406, !410, !411, !413}
!402 = !DILocalVariable(name: "plaintext", arg: 1, scope: !394, file: !3, line: 300, type: !72)
!403 = !DILocalVariable(name: "len", arg: 2, scope: !394, file: !3, line: 300, type: !397)
!404 = !DILocalVariable(name: "key", arg: 3, scope: !394, file: !3, line: 300, type: !72)
!405 = !DILocalVariable(name: "ciphertext", arg: 4, scope: !394, file: !3, line: 301, type: !72)
!406 = !DILocalVariable(name: "round_keys", scope: !394, file: !3, line: 308, type: !407)
!407 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1408, elements: !408)
!408 = !{!409}
!409 = !DISubrange(count: 176)
!410 = !DILocalVariable(name: "copy_key", scope: !394, file: !3, line: 309, type: !407)
!411 = !DILocalVariable(name: "i", scope: !412, file: !3, line: 312, type: !397)
!412 = distinct !DILexicalBlock(scope: !394, file: !3, line: 312, column: 3)
!413 = !DILocalVariable(name: "z", scope: !414, file: !3, line: 313, type: !397)
!414 = distinct !DILexicalBlock(scope: !415, file: !3, line: 313, column: 5)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 312, column: 40)
!416 = distinct !DILexicalBlock(scope: !412, file: !3, line: 312, column: 3)
!417 = distinct !DIAssignID()
!418 = !DILocation(line: 0, scope: !394)
!419 = distinct !DIAssignID()
!420 = !DILocation(line: 302, column: 11, scope: !421)
!421 = distinct !DILexicalBlock(scope: !394, file: !3, line: 302, column: 7)
!422 = !DILocation(line: 302, column: 16, scope: !421)
!423 = !DILocation(line: 308, column: 3, scope: !394)
!424 = !DILocation(line: 309, column: 3, scope: !394)
!425 = !DILocation(line: 310, column: 3, scope: !394)
!426 = !DILocation(line: 0, scope: !412)
!427 = !DILocation(line: 312, column: 24, scope: !416)
!428 = !DILocation(line: 312, column: 3, scope: !412)
!429 = !DILocation(line: 0, scope: !414)
!430 = !DILocation(line: 314, column: 19, scope: !431)
!431 = distinct !DILexicalBlock(scope: !432, file: !3, line: 313, column: 38)
!432 = distinct !DILexicalBlock(scope: !414, file: !3, line: 313, column: 5)
!433 = !DILocation(line: 316, column: 27, scope: !415)
!434 = !DILocation(line: 316, column: 52, scope: !415)
!435 = !DILocation(line: 316, column: 5, scope: !415)
!436 = !DILocation(line: 312, column: 33, scope: !416)
!437 = distinct !{!437, !428, !438, !68}
!438 = !DILocation(line: 317, column: 3, scope: !412)
!439 = !DILocation(line: 318, column: 1, scope: !394)
!440 = distinct !DISubprogram(name: "write_to_address", scope: !3, file: !3, line: 320, type: !441, scopeLine: 320, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !445)
!441 = !DISubroutineType(types: !442)
!442 = !{null, !443, !6}
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !7, line: 82, baseType: !444)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintptr_t", file: !9, line: 232, baseType: !10)
!445 = !{!446, !447}
!446 = !DILocalVariable(name: "addr", arg: 1, scope: !440, file: !3, line: 320, type: !443)
!447 = !DILocalVariable(name: "value", arg: 2, scope: !440, file: !3, line: 320, type: !6)
!448 = !DILocation(line: 0, scope: !440)
!449 = !DILocation(line: 321, column: 4, scope: !440)
!450 = !DILocation(line: 321, column: 30, scope: !440)
!451 = !DILocation(line: 322, column: 1, scope: !440)
!452 = distinct !DISubprogram(name: "write_v_to_address", scope: !3, file: !3, line: 324, type: !453, scopeLine: 324, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !455)
!453 = !DISubroutineType(types: !454)
!454 = !{null, !443, !72}
!455 = !{!456, !457, !458, !459}
!456 = !DILocalVariable(name: "addr", arg: 1, scope: !452, file: !3, line: 324, type: !443)
!457 = !DILocalVariable(name: "vector", arg: 2, scope: !452, file: !3, line: 324, type: !72)
!458 = !DILocalVariable(name: "vector_word", scope: !452, file: !3, line: 325, type: !5)
!459 = !DILocalVariable(name: "i", scope: !460, file: !3, line: 326, type: !49)
!460 = distinct !DILexicalBlock(scope: !452, file: !3, line: 326, column: 3)
!461 = !DILocation(line: 0, scope: !452)
!462 = !DILocation(line: 0, scope: !460)
!463 = !DILocation(line: 326, column: 3, scope: !460)
!464 = !DILocation(line: 329, column: 1, scope: !452)
!465 = !DILocation(line: 327, column: 31, scope: !466)
!466 = distinct !DILexicalBlock(scope: !467, file: !3, line: 326, column: 31)
!467 = distinct !DILexicalBlock(scope: !460, file: !3, line: 326, column: 3)
!468 = !DILocation(line: 327, column: 27, scope: !466)
!469 = !DILocation(line: 327, column: 38, scope: !466)
!470 = !DILocation(line: 0, scope: !440, inlinedAt: !471)
!471 = distinct !DILocation(line: 327, column: 5, scope: !466)
!472 = !DILocation(line: 321, column: 4, scope: !440, inlinedAt: !471)
!473 = !DILocation(line: 321, column: 30, scope: !440, inlinedAt: !471)
!474 = !DILocation(line: 326, column: 27, scope: !467)
!475 = !DILocation(line: 326, column: 21, scope: !467)
!476 = distinct !{!476, !463, !477, !68}
!477 = !DILocation(line: 328, column: 3, scope: !460)
!478 = distinct !DISubprogram(name: "write_numb_to_address", scope: !3, file: !3, line: 331, type: !453, scopeLine: 331, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !479)
!479 = !{!480, !481, !482}
!480 = !DILocalVariable(name: "addr", arg: 1, scope: !478, file: !3, line: 331, type: !443)
!481 = !DILocalVariable(name: "vector", arg: 2, scope: !478, file: !3, line: 331, type: !72)
!482 = !DILocalVariable(name: "vector_word", scope: !478, file: !3, line: 332, type: !5)
!483 = !DILocation(line: 0, scope: !478)
!484 = !DILocation(line: 333, column: 26, scope: !478)
!485 = !DILocation(line: 0, scope: !440, inlinedAt: !486)
!486 = distinct !DILocation(line: 333, column: 3, scope: !478)
!487 = !DILocation(line: 321, column: 4, scope: !440, inlinedAt: !486)
!488 = !DILocation(line: 321, column: 30, scope: !440, inlinedAt: !486)
!489 = !DILocation(line: 334, column: 1, scope: !478)
!490 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 336, type: !491, scopeLine: 336, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !493)
!491 = !DISubroutineType(types: !492)
!492 = !{!49}
!493 = !{!494, !495, !496, !497, !498, !499, !500, !501}
!494 = !DILocalVariable(name: "ciphertext", scope: !490, file: !3, line: 340, type: !279)
!495 = !DILocalVariable(name: "key", scope: !490, file: !3, line: 344, type: !279)
!496 = !DILocalVariable(name: "expected_output", scope: !490, file: !3, line: 347, type: !279)
!497 = !DILocalVariable(name: "plaintext", scope: !490, file: !3, line: 350, type: !279)
!498 = !DILocalVariable(name: "len", scope: !490, file: !3, line: 351, type: !397)
!499 = !DILocalVariable(name: "addr", scope: !490, file: !3, line: 353, type: !443)
!500 = !DILocalVariable(name: "value", scope: !490, file: !3, line: 354, type: !6)
!501 = !DILocalVariable(name: "i", scope: !502, file: !3, line: 384, type: !49)
!502 = distinct !DILexicalBlock(scope: !490, file: !3, line: 384, column: 3)
!503 = distinct !DIAssignID()
!504 = !DILocation(line: 0, scope: !490)
!505 = distinct !DIAssignID()
!506 = distinct !DIAssignID()
!507 = distinct !DIAssignID()
!508 = distinct !DIAssignID()
!509 = distinct !DIAssignID()
!510 = distinct !DIAssignID()
!511 = !DILocation(line: 350, column: 3, scope: !490)
!512 = !DILocation(line: 356, column: 3, scope: !490)
!513 = !DILocation(line: 0, scope: !452, inlinedAt: !514)
!514 = distinct !DILocation(line: 359, column: 3, scope: !490)
!515 = !DILocation(line: 0, scope: !460, inlinedAt: !514)
!516 = !DILocation(line: 0, scope: !440, inlinedAt: !517)
!517 = distinct !DILocation(line: 327, column: 5, scope: !466, inlinedAt: !514)
!518 = !DILocation(line: 321, column: 30, scope: !440, inlinedAt: !517)
!519 = !DILocation(line: 0, scope: !460, inlinedAt: !520)
!520 = distinct !DILocation(line: 362, column: 3, scope: !490)
!521 = !DILocation(line: 327, column: 38, scope: !466, inlinedAt: !520)
!522 = !DILocation(line: 0, scope: !440, inlinedAt: !523)
!523 = distinct !DILocation(line: 327, column: 5, scope: !466, inlinedAt: !520)
!524 = !DILocation(line: 321, column: 30, scope: !440, inlinedAt: !523)
!525 = !DILocation(line: 384, column: 3, scope: !502)
!526 = !DILocation(line: 384, column: 28, scope: !527)
!527 = distinct !DILexicalBlock(scope: !502, file: !3, line: 384, column: 3)
!528 = !DILocation(line: 0, scope: !502)
!529 = !DILocation(line: 384, column: 21, scope: !527)
!530 = distinct !{!530, !525, !531, !68}
!531 = !DILocation(line: 389, column: 3, scope: !502)
!532 = !DILocation(line: 385, column: 9, scope: !533)
!533 = distinct !DILexicalBlock(scope: !534, file: !3, line: 385, column: 9)
!534 = distinct !DILexicalBlock(scope: !527, file: !3, line: 384, column: 32)
!535 = !DILocation(line: 385, column: 25, scope: !533)
!536 = !DILocation(line: 385, column: 22, scope: !533)
!537 = !DILocation(line: 0, scope: !440, inlinedAt: !538)
!538 = distinct !DILocation(line: 390, column: 3, scope: !490)
!539 = !DILocation(line: 321, column: 30, scope: !440, inlinedAt: !538)
!540 = !DILocation(line: 0, scope: !440, inlinedAt: !541)
!541 = distinct !DILocation(line: 396, column: 3, scope: !490)
!542 = !DILocation(line: 321, column: 30, scope: !440, inlinedAt: !541)
!543 = !DILocation(line: 399, column: 1, scope: !490)

; ModuleID = 'main_d.c'
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
  ret i8 %12, !dbg !56

4:                                                ; preds = %2, %4
  %5 = phi i8 [ %0, %2 ], [ %16, %4 ]
  %6 = phi i32 [ 0, %2 ], [ %18, %4 ]
  %7 = phi i8 [ 0, %2 ], [ %12, %4 ]
  %8 = phi i8 [ %1, %2 ], [ %17, %4 ]
    #dbg_value(i8 %5, !44, !DIExpression(), !53)
    #dbg_value(i32 %6, !47, !DIExpression(), !54)
    #dbg_value(i8 %7, !46, !DIExpression(), !53)
    #dbg_value(i8 %8, !45, !DIExpression(), !53)
  %9 = and i8 %8, 1, !dbg !57
  %10 = icmp eq i8 %9, 0, !dbg !57
  %11 = select i1 %10, i8 0, i8 %5, !dbg !57
  %12 = xor i8 %11, %7, !dbg !57
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @expand_key(ptr nocapture noundef readonly %0, ptr nocapture noundef %1) local_unnamed_addr #2 !dbg !69 {
    #dbg_value(ptr %0, !74, !DIExpression(), !103)
    #dbg_value(ptr %1, !75, !DIExpression(), !103)
    #dbg_value(i32 0, !76, !DIExpression(), !103)
  br label %3, !dbg !104

3:                                                ; preds = %2, %3
  %4 = phi i32 [ 0, %2 ], [ %8, %3 ]
    #dbg_value(i32 %4, !76, !DIExpression(), !103)
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 %4, !dbg !106
  %6 = load i8, ptr %5, align 1, !dbg !106, !tbaa !109
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 %4, !dbg !112
  store i8 %6, ptr %7, align 1, !dbg !113, !tbaa !109
  %8 = add nuw nsw i32 %4, 1, !dbg !114
    #dbg_value(i32 %8, !76, !DIExpression(), !103)
  %9 = icmp eq i32 %8, 16, !dbg !115
  br i1 %9, label %10, label %3, !dbg !104, !llvm.loop !116

10:                                               ; preds = %3, %41
  %11 = phi i32 [ %64, %41 ], [ 16, %3 ]
    #dbg_value(i32 %11, !76, !DIExpression(), !103)
  %12 = getelementptr i8, ptr %1, i32 %11, !dbg !118
  %13 = getelementptr i8, ptr %12, i32 -4, !dbg !118
  %14 = load i8, ptr %13, align 1, !dbg !118, !tbaa !109
    #dbg_value(i8 %14, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !119)
  %15 = getelementptr i8, ptr %12, i32 -3, !dbg !120
  %16 = load i8, ptr %15, align 1, !dbg !120, !tbaa !109
    #dbg_value(i8 %16, !77, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !119)
  %17 = getelementptr i8, ptr %12, i32 -2, !dbg !121
  %18 = load i8, ptr %17, align 1, !dbg !121, !tbaa !109
    #dbg_value(i8 %18, !77, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !119)
  %19 = getelementptr i8, ptr %12, i32 -1, !dbg !122
  %20 = load i8, ptr %19, align 1, !dbg !122, !tbaa !109
    #dbg_value(i8 %20, !77, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !119)
  %21 = and i32 %11, 12, !dbg !123
  %22 = icmp eq i32 %21, 0, !dbg !124
  br i1 %22, label %23, label %41, !dbg !124

23:                                               ; preds = %10
    #dbg_value(i8 %14, !83, !DIExpression(), !125)
  %24 = zext i8 %16 to i32, !dbg !126
  %25 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %24, !dbg !126
  %26 = load i8, ptr %25, align 1, !dbg !126, !tbaa !109
    #dbg_value(i8 %26, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !119)
  %27 = zext i8 %18 to i32, !dbg !127
  %28 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %27, !dbg !127
  %29 = load i8, ptr %28, align 1, !dbg !127, !tbaa !109
    #dbg_value(i8 %29, !77, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !119)
  %30 = zext i8 %20 to i32, !dbg !128
  %31 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %30, !dbg !128
  %32 = load i8, ptr %31, align 1, !dbg !128, !tbaa !109
    #dbg_value(i8 %32, !77, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !119)
  %33 = zext i8 %14 to i32, !dbg !129
  %34 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %33, !dbg !129
  %35 = load i8, ptr %34, align 1, !dbg !129, !tbaa !109
    #dbg_value(i8 %35, !77, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !119)
  %36 = lshr exact i32 %11, 4, !dbg !130
  %37 = add nsw i32 %36, -1, !dbg !131
  %38 = getelementptr inbounds [10 x i8], ptr @rcon, i32 0, i32 %37, !dbg !132
  %39 = load i8, ptr %38, align 1, !dbg !132, !tbaa !109
  %40 = xor i8 %39, %26, !dbg !133
    #dbg_value(i8 %40, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !119)
  br label %41, !dbg !134

41:                                               ; preds = %23, %10
  %42 = phi i8 [ %40, %23 ], [ %14, %10 ], !dbg !119
  %43 = phi i8 [ %29, %23 ], [ %16, %10 ], !dbg !119
  %44 = phi i8 [ %32, %23 ], [ %18, %10 ], !dbg !119
  %45 = phi i8 [ %35, %23 ], [ %20, %10 ], !dbg !119
    #dbg_value(i8 %45, !77, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !119)
    #dbg_value(i8 %44, !77, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !119)
    #dbg_value(i8 %43, !77, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !119)
    #dbg_value(i8 %42, !77, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !119)
  %46 = getelementptr i8, ptr %12, i32 -16, !dbg !135
  %47 = load i8, ptr %46, align 1, !dbg !135, !tbaa !109
  %48 = xor i8 %47, %42, !dbg !136
  store i8 %48, ptr %12, align 1, !dbg !137, !tbaa !109
  %49 = getelementptr i8, ptr %12, i32 -15, !dbg !138
  %50 = load i8, ptr %49, align 1, !dbg !138, !tbaa !109
  %51 = xor i8 %50, %43, !dbg !139
  %52 = or disjoint i32 %11, 1, !dbg !140
  %53 = getelementptr inbounds nuw i8, ptr %1, i32 %52, !dbg !141
  store i8 %51, ptr %53, align 1, !dbg !142, !tbaa !109
  %54 = getelementptr i8, ptr %12, i32 -14, !dbg !143
  %55 = load i8, ptr %54, align 1, !dbg !143, !tbaa !109
  %56 = xor i8 %55, %44, !dbg !144
  %57 = or disjoint i32 %11, 2, !dbg !145
  %58 = getelementptr inbounds nuw i8, ptr %1, i32 %57, !dbg !146
  store i8 %56, ptr %58, align 1, !dbg !147, !tbaa !109
  %59 = getelementptr i8, ptr %12, i32 -13, !dbg !148
  %60 = load i8, ptr %59, align 1, !dbg !148, !tbaa !109
  %61 = xor i8 %60, %45, !dbg !149
  %62 = or disjoint i32 %11, 3, !dbg !150
  %63 = getelementptr inbounds nuw i8, ptr %1, i32 %62, !dbg !151
  store i8 %61, ptr %63, align 1, !dbg !152, !tbaa !109
  %64 = add nuw nsw i32 %11, 4, !dbg !153
    #dbg_value(i32 %64, !76, !DIExpression(), !103)
  %65 = icmp samesign ult i32 %11, 172, !dbg !154
  br i1 %65, label %10, label %67, !dbg !155, !llvm.loop !156

66:                                               ; preds = %70
  ret void, !dbg !158

67:                                               ; preds = %41, %70
  %68 = phi i32 [ %71, %70 ], [ 16, %41 ]
    #dbg_value(i32 %68, !86, !DIExpression(), !159)
  %69 = getelementptr inbounds nuw i8, ptr %1, i32 %68, !dbg !160
    #dbg_value(ptr %69, !90, !DIExpression(), !161)
    #dbg_value(i32 0, !93, !DIExpression(), !162)
  br label %73, !dbg !163

70:                                               ; preds = %87
  %71 = add nuw nsw i32 %68, 16, !dbg !164
    #dbg_value(i32 %71, !86, !DIExpression(), !159)
  %72 = icmp samesign ult i32 %68, 144, !dbg !165
  br i1 %72, label %67, label %66, !dbg !166, !llvm.loop !167

73:                                               ; preds = %67, %87
  %74 = phi i32 [ 0, %67 ], [ %88, %87 ]
    #dbg_value(i32 %74, !93, !DIExpression(), !162)
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
    #dbg_value(i32 %88, !93, !DIExpression(), !162)
  %89 = icmp eq i32 %88, 4, !dbg !181
  br i1 %89, label %70, label %73, !dbg !163, !llvm.loop !182

90:                                               ; preds = %73, %168
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
  %149 = xor i8 %121, %102, !dbg !228
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
  %169 = xor i8 %149, %140, !dbg !243
  %170 = xor i8 %169, %160, !dbg !244
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

4:                                                ; preds = %2, %4
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
  br label %44, !dbg !310

20:                                               ; preds = %44
    #dbg_value(ptr %4, !288, !DIExpression(), !291)
    #dbg_value(ptr %1, !289, !DIExpression(), !291)
  %21 = load i32, ptr %1, align 4, !dbg !311, !tbaa !307
  %22 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %21, i32 %75, i32 0, i32 %21) #6, !dbg !311, !srcloc !312
  store i32 %22, ptr %1, align 4, !dbg !311, !tbaa !307
  %23 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %22, i32 %74, i32 1, i32 %22) #6, !dbg !313, !srcloc !314
  store i32 %23, ptr %1, align 4, !dbg !313, !tbaa !307
  %24 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %23, i32 %77, i32 2, i32 %23) #6, !dbg !315, !srcloc !316
  store i32 %24, ptr %1, align 4, !dbg !315, !tbaa !307
  %25 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %24, i32 %76, i32 3, i32 %24) #6, !dbg !317, !srcloc !318
  store i32 %25, ptr %1, align 4, !dbg !317, !tbaa !307
  %26 = getelementptr inbounds nuw i8, ptr %1, i32 4, !dbg !319
  %27 = load i32, ptr %26, align 4, !dbg !320, !tbaa !307
  %28 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %27, i32 %76, i32 0, i32 %27) #6, !dbg !320, !srcloc !321
  store i32 %28, ptr %26, align 4, !dbg !320, !tbaa !307
  %29 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %28, i32 %75, i32 1, i32 %28) #6, !dbg !322, !srcloc !323
  store i32 %29, ptr %26, align 4, !dbg !322, !tbaa !307
  %30 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %29, i32 %74, i32 2, i32 %29) #6, !dbg !324, !srcloc !325
  store i32 %30, ptr %26, align 4, !dbg !324, !tbaa !307
  %31 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %30, i32 %77, i32 3, i32 %30) #6, !dbg !326, !srcloc !327
  store i32 %31, ptr %26, align 4, !dbg !326, !tbaa !307
  %32 = getelementptr inbounds nuw i8, ptr %1, i32 8, !dbg !328
  %33 = load i32, ptr %32, align 4, !dbg !329, !tbaa !307
  %34 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %33, i32 %77, i32 0, i32 %33) #6, !dbg !329, !srcloc !330
  store i32 %34, ptr %32, align 4, !dbg !329, !tbaa !307
  %35 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %34, i32 %76, i32 1, i32 %34) #6, !dbg !331, !srcloc !332
  store i32 %35, ptr %32, align 4, !dbg !331, !tbaa !307
  %36 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %35, i32 %75, i32 2, i32 %35) #6, !dbg !333, !srcloc !334
  store i32 %36, ptr %32, align 4, !dbg !333, !tbaa !307
  %37 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %36, i32 %74, i32 3, i32 %36) #6, !dbg !335, !srcloc !336
  store i32 %37, ptr %32, align 4, !dbg !335, !tbaa !307
  %38 = getelementptr inbounds nuw i8, ptr %1, i32 12, !dbg !337
  %39 = load i32, ptr %38, align 4, !dbg !338, !tbaa !307
  %40 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %39, i32 %74, i32 0, i32 %39) #6, !dbg !338, !srcloc !339
  store i32 %40, ptr %38, align 4, !dbg !338, !tbaa !307
  %41 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %40, i32 %77, i32 1, i32 %40) #6, !dbg !340, !srcloc !341
  store i32 %41, ptr %38, align 4, !dbg !340, !tbaa !307
  %42 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %41, i32 %76, i32 2, i32 %41) #6, !dbg !342, !srcloc !343
  store i32 %42, ptr %38, align 4, !dbg !342, !tbaa !307
  %43 = tail call i32 asm sideeffect "aes32dsi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %42, i32 %75, i32 3, i32 %42) #6, !dbg !344, !srcloc !345
  store i32 %43, ptr %38, align 4, !dbg !344, !tbaa !307
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %0, ptr noundef nonnull align 4 dereferenceable(16) %1, i32 16, i1 false), !dbg !346
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #6, !dbg !347
  ret void, !dbg !347

44:                                               ; preds = %15, %44
  %45 = phi i32 [ 9, %15 ], [ %78, %44 ]
  %46 = phi i32 [ %16, %15 ], [ %75, %44 ]
    #dbg_value(i32 %45, !282, !DIExpression(), !309)
    #dbg_value(ptr %4, !284, !DIExpression(), !348)
  %47 = shl nsw i32 %45, 4, !dbg !349
  %48 = getelementptr inbounds nuw i8, ptr %1, i32 %47, !dbg !350
    #dbg_value(ptr %48, !287, !DIExpression(), !348)
  %49 = load i32, ptr %48, align 4, !dbg !351, !tbaa !307
  %50 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %49, i32 %46, i32 0, i32 %49) #6, !dbg !351, !srcloc !352
  store i32 %50, ptr %48, align 4, !dbg !351, !tbaa !307
  %51 = load i32, ptr %17, align 4, !dbg !353, !tbaa !307
  %52 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %50, i32 %51, i32 1, i32 %50) #6, !dbg !354, !srcloc !355
  store i32 %52, ptr %48, align 4, !dbg !354, !tbaa !307
  %53 = load i32, ptr %18, align 4, !dbg !356, !tbaa !307
  %54 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %52, i32 %53, i32 2, i32 %52) #6, !dbg !357, !srcloc !358
  store i32 %54, ptr %48, align 4, !dbg !357, !tbaa !307
  %55 = load i32, ptr %19, align 4, !dbg !359, !tbaa !307
  %56 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %54, i32 %55, i32 3, i32 %54) #6, !dbg !360, !srcloc !361
  store i32 %56, ptr %48, align 4, !dbg !360, !tbaa !307
  %57 = getelementptr inbounds nuw i8, ptr %48, i32 4, !dbg !362
  %58 = load i32, ptr %57, align 4, !dbg !363, !tbaa !307
  %59 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %58, i32 %55, i32 0, i32 %58) #6, !dbg !363, !srcloc !364
  store i32 %59, ptr %57, align 4, !dbg !363, !tbaa !307
  %60 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %59, i32 %46, i32 1, i32 %59) #6, !dbg !365, !srcloc !366
  store i32 %60, ptr %57, align 4, !dbg !365, !tbaa !307
  %61 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %60, i32 %51, i32 2, i32 %60) #6, !dbg !367, !srcloc !368
  store i32 %61, ptr %57, align 4, !dbg !367, !tbaa !307
  %62 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %61, i32 %53, i32 3, i32 %61) #6, !dbg !369, !srcloc !370
  store i32 %62, ptr %57, align 4, !dbg !369, !tbaa !307
  %63 = getelementptr inbounds nuw i8, ptr %48, i32 8, !dbg !371
  %64 = load i32, ptr %63, align 4, !dbg !372, !tbaa !307
  %65 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %64, i32 %53, i32 0, i32 %64) #6, !dbg !372, !srcloc !373
  store i32 %65, ptr %63, align 4, !dbg !372, !tbaa !307
  %66 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %65, i32 %55, i32 1, i32 %65) #6, !dbg !374, !srcloc !375
  store i32 %66, ptr %63, align 4, !dbg !374, !tbaa !307
  %67 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %66, i32 %46, i32 2, i32 %66) #6, !dbg !376, !srcloc !377
  store i32 %67, ptr %63, align 4, !dbg !376, !tbaa !307
  %68 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %67, i32 %51, i32 3, i32 %67) #6, !dbg !378, !srcloc !379
  store i32 %68, ptr %63, align 4, !dbg !378, !tbaa !307
  %69 = getelementptr inbounds nuw i8, ptr %48, i32 12, !dbg !380
  %70 = load i32, ptr %69, align 4, !dbg !381, !tbaa !307
  %71 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %70, i32 %51, i32 0, i32 %70) #6, !dbg !381, !srcloc !382
  store i32 %71, ptr %69, align 4, !dbg !381, !tbaa !307
  %72 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %71, i32 %53, i32 1, i32 %71) #6, !dbg !383, !srcloc !384
  store i32 %72, ptr %69, align 4, !dbg !383, !tbaa !307
  %73 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %72, i32 %55, i32 2, i32 %72) #6, !dbg !385, !srcloc !386
  store i32 %73, ptr %69, align 4, !dbg !385, !tbaa !307
  %74 = tail call i32 asm sideeffect "aes32dsmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %73, i32 %46, i32 3, i32 %73) #6, !dbg !387, !srcloc !388
  store i32 %74, ptr %69, align 4, !dbg !387, !tbaa !307
  %75 = load i32, ptr %48, align 4, !dbg !389, !tbaa !307
  %76 = load i32, ptr %57, align 4, !dbg !390, !tbaa !307
  store i32 %76, ptr %19, align 4, !dbg !391, !tbaa !307
  %77 = load i32, ptr %63, align 4, !dbg !392, !tbaa !307
  store i32 %77, ptr %18, align 4, !dbg !393, !tbaa !307
  store i32 %74, ptr %17, align 4, !dbg !394, !tbaa !307
  %78 = add nsw i32 %45, -1, !dbg !395
    #dbg_value(i32 %78, !282, !DIExpression(), !309)
  %79 = icmp ugt i32 %45, 1, !dbg !396
  br i1 %79, label %44, label %20, !dbg !310, !llvm.loop !397
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #4

; Function Attrs: nounwind optsize
define dso_local void @aes128_ecb_decrypt(ptr nocapture noundef writeonly %0, i32 noundef %1, ptr nocapture noundef readonly %2, ptr nocapture noundef readonly %3) local_unnamed_addr #3 !dbg !399 {
  %5 = alloca [176 x i8], align 1, !DIAssignID !422
    #dbg_assign(i1 undef, !411, !DIExpression(), !422, ptr %5, !DIExpression(), !423)
  %6 = alloca [176 x i8], align 1, !DIAssignID !424
    #dbg_assign(i1 undef, !415, !DIExpression(), !424, ptr %6, !DIExpression(), !423)
    #dbg_value(ptr %0, !407, !DIExpression(), !423)
    #dbg_value(i32 %1, !408, !DIExpression(), !423)
    #dbg_value(ptr %2, !409, !DIExpression(), !423)
    #dbg_value(ptr %3, !410, !DIExpression(), !423)
  %7 = and i32 %1, 15, !dbg !425
  %8 = icmp eq i32 %7, 0, !dbg !427
  br i1 %8, label %9, label %18, !dbg !427

9:                                                ; preds = %4
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %5) #6, !dbg !428
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %6) #6, !dbg !429
  call void @expand_key(ptr noundef %2, ptr noundef nonnull %5) #7, !dbg !430
    #dbg_value(i32 0, !416, !DIExpression(), !431)
  %10 = icmp eq i32 %1, 0, !dbg !432
  br i1 %10, label %17, label %11, !dbg !433

11:                                               ; preds = %9, %11
  %12 = phi i32 [ %15, %11 ], [ 0, %9 ]
    #dbg_value(i32 %12, !416, !DIExpression(), !431)
    #dbg_value(i32 0, !418, !DIExpression(), !434)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(176) %6, ptr noundef nonnull align 1 dereferenceable(176) %5, i32 176, i1 false), !dbg !435, !tbaa !109
    #dbg_value(i32 poison, !418, !DIExpression(), !434)
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 %12, !dbg !438
  %14 = getelementptr inbounds nuw i8, ptr %3, i32 %12, !dbg !439
  call void @aes128_decrypt_block(ptr noundef %13, ptr noundef nonnull %6, ptr noundef %14) #7, !dbg !440
  %15 = add i32 %12, 16, !dbg !441
    #dbg_value(i32 %15, !416, !DIExpression(), !431)
  %16 = icmp ult i32 %15, %1, !dbg !432
  br i1 %16, label %11, label %17, !dbg !433, !llvm.loop !442

17:                                               ; preds = %11, %9
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %6) #6, !dbg !444
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %5) #6, !dbg !444
  br label %18, !dbg !444

18:                                               ; preds = %4, %17
  ret void, !dbg !444
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_to_address(i32 noundef %0, i32 noundef %1) local_unnamed_addr #5 !dbg !445 {
    #dbg_value(i32 %0, !451, !DIExpression(), !453)
    #dbg_value(i32 %1, !452, !DIExpression(), !453)
  %3 = inttoptr i32 %0 to ptr, !dbg !454
  store volatile i32 %1, ptr %3, align 4, !dbg !455, !tbaa !307
  ret void, !dbg !456
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_v_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #5 !dbg !457 {
    #dbg_value(i32 %0, !461, !DIExpression(), !466)
    #dbg_value(ptr %1, !462, !DIExpression(), !466)
    #dbg_value(ptr %1, !463, !DIExpression(), !466)
    #dbg_value(i32 0, !464, !DIExpression(), !467)
  br label %4, !dbg !468

3:                                                ; preds = %4
  ret void, !dbg !469

4:                                                ; preds = %2, %4
  %5 = phi i32 [ 0, %2 ], [ %11, %4 ]
    #dbg_value(i32 %5, !464, !DIExpression(), !467)
  %6 = shl nuw nsw i32 %5, 2, !dbg !470
  %7 = add i32 %6, %0, !dbg !473
  %8 = getelementptr inbounds nuw i32, ptr %1, i32 %5, !dbg !474
  %9 = load i32, ptr %8, align 4, !dbg !474, !tbaa !307
    #dbg_value(i32 %7, !451, !DIExpression(), !475)
    #dbg_value(i32 %9, !452, !DIExpression(), !475)
  %10 = inttoptr i32 %7 to ptr, !dbg !477
  store volatile i32 %9, ptr %10, align 4, !dbg !478, !tbaa !307
  %11 = add nuw nsw i32 %5, 1, !dbg !479
    #dbg_value(i32 %11, !464, !DIExpression(), !467)
  %12 = icmp eq i32 %11, 4, !dbg !480
  br i1 %12, label %3, label %4, !dbg !468, !llvm.loop !481
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_numb_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #5 !dbg !483 {
    #dbg_value(i32 %0, !485, !DIExpression(), !488)
    #dbg_value(ptr %1, !486, !DIExpression(), !488)
    #dbg_value(ptr %1, !487, !DIExpression(), !488)
  %3 = load i32, ptr %1, align 4, !dbg !489, !tbaa !307
    #dbg_value(i32 %0, !451, !DIExpression(), !490)
    #dbg_value(i32 %3, !452, !DIExpression(), !490)
  %4 = inttoptr i32 %0 to ptr, !dbg !492
  store volatile i32 %3, ptr %4, align 4, !dbg !493, !tbaa !307
  ret void, !dbg !494
}

; Function Attrs: nounwind optsize
define dso_local noundef i32 @main() local_unnamed_addr #3 !dbg !495 {
    #dbg_assign(i1 undef, !499, !DIExpression(), !508, ptr @__const.main.ciphertext, !DIExpression(), !509)
    #dbg_assign(i1 undef, !500, !DIExpression(), !510, ptr @__const.main.key, !DIExpression(), !509)
    #dbg_assign(i1 undef, !501, !DIExpression(), !511, ptr @__const.main.expected_output, !DIExpression(), !509)
  %1 = alloca [16 x i8], align 1, !DIAssignID !512
    #dbg_assign(i1 undef, !502, !DIExpression(), !512, ptr %1, !DIExpression(), !509)
    #dbg_assign(i1 undef, !499, !DIExpression(), !513, ptr @__const.main.ciphertext, !DIExpression(), !509)
    #dbg_assign(i1 undef, !500, !DIExpression(), !514, ptr @__const.main.key, !DIExpression(), !509)
    #dbg_assign(i1 undef, !501, !DIExpression(), !515, ptr @__const.main.expected_output, !DIExpression(), !509)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #6, !dbg !516
    #dbg_value(i32 16, !503, !DIExpression(), !509)
  call void @aes128_ecb_decrypt(ptr noundef nonnull %1, i32 noundef 16, ptr noundef nonnull @__const.main.key, ptr noundef nonnull @__const.main.ciphertext) #7, !dbg !517
    #dbg_value(i32 1056816, !504, !DIExpression(), !509)
    #dbg_value(i32 1056816, !461, !DIExpression(), !518)
    #dbg_value(ptr @__const.main.expected_output, !462, !DIExpression(), !518)
    #dbg_value(ptr @__const.main.expected_output, !463, !DIExpression(), !518)
    #dbg_value(i32 0, !464, !DIExpression(), !520)
    #dbg_value(i32 0, !464, !DIExpression(), !520)
    #dbg_value(i32 1056816, !451, !DIExpression(), !521)
    #dbg_value(i32 1819043144, !452, !DIExpression(), !521)
  store volatile i32 1819043144, ptr inttoptr (i32 1056816 to ptr), align 16, !dbg !523, !tbaa !307
    #dbg_value(i32 1, !464, !DIExpression(), !520)
    #dbg_value(i32 1056820, !451, !DIExpression(), !521)
    #dbg_value(i32 1461726319, !452, !DIExpression(), !521)
  store volatile i32 1461726319, ptr inttoptr (i32 1056820 to ptr), align 4, !dbg !523, !tbaa !307
    #dbg_value(i32 2, !464, !DIExpression(), !520)
    #dbg_value(i32 1056824, !451, !DIExpression(), !521)
    #dbg_value(i32 1684828783, !452, !DIExpression(), !521)
  store volatile i32 1684828783, ptr inttoptr (i32 1056824 to ptr), align 8, !dbg !523, !tbaa !307
    #dbg_value(i32 3, !464, !DIExpression(), !520)
    #dbg_value(i32 1056828, !451, !DIExpression(), !521)
    #dbg_value(i32 808464417, !452, !DIExpression(), !521)
  store volatile i32 808464417, ptr inttoptr (i32 1056828 to ptr), align 4, !dbg !523, !tbaa !307
    #dbg_value(i32 4, !464, !DIExpression(), !520)
    #dbg_value(i32 0, !464, !DIExpression(), !524)
  %2 = load i32, ptr %1, align 4, !dbg !526, !tbaa !307
    #dbg_value(i32 1056832, !451, !DIExpression(), !527)
    #dbg_value(i32 %2, !452, !DIExpression(), !527)
  store volatile i32 %2, ptr inttoptr (i32 1056832 to ptr), align 64, !dbg !529, !tbaa !307
    #dbg_value(i32 1, !464, !DIExpression(), !524)
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 4, !dbg !526
  %4 = load i32, ptr %3, align 4, !dbg !526, !tbaa !307
    #dbg_value(i32 1056836, !451, !DIExpression(), !527)
    #dbg_value(i32 %4, !452, !DIExpression(), !527)
  store volatile i32 %4, ptr inttoptr (i32 1056836 to ptr), align 4, !dbg !529, !tbaa !307
    #dbg_value(i32 2, !464, !DIExpression(), !524)
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 8, !dbg !526
  %6 = load i32, ptr %5, align 4, !dbg !526, !tbaa !307
    #dbg_value(i32 1056840, !451, !DIExpression(), !527)
    #dbg_value(i32 %6, !452, !DIExpression(), !527)
  store volatile i32 %6, ptr inttoptr (i32 1056840 to ptr), align 8, !dbg !529, !tbaa !307
    #dbg_value(i32 3, !464, !DIExpression(), !524)
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 12, !dbg !526
  %8 = load i32, ptr %7, align 4, !dbg !526, !tbaa !307
    #dbg_value(i32 1056844, !451, !DIExpression(), !527)
    #dbg_value(i32 %8, !452, !DIExpression(), !527)
  store volatile i32 %8, ptr inttoptr (i32 1056844 to ptr), align 4, !dbg !529, !tbaa !307
    #dbg_value(i32 4, !464, !DIExpression(), !524)
  br label %12, !dbg !530

9:                                                ; preds = %12
  %10 = add nuw nsw i32 %13, 1, !dbg !531
    #dbg_value(i32 %10, !506, !DIExpression(), !533)
    #dbg_value(i32 %10, !506, !DIExpression(), !533)
  %11 = icmp eq i32 %10, 16, !dbg !534
  br i1 %11, label %19, label %12, !dbg !530, !llvm.loop !535

12:                                               ; preds = %0, %9
  %13 = phi i32 [ %10, %9 ], [ 0, %0 ]
    #dbg_value(i32 %13, !506, !DIExpression(), !533)
  %14 = getelementptr inbounds nuw [16 x i8], ptr %1, i32 0, i32 %13, !dbg !537
  %15 = load i8, ptr %14, align 1, !dbg !537, !tbaa !109
  %16 = getelementptr inbounds nuw [16 x i8], ptr @__const.main.expected_output, i32 0, i32 %13, !dbg !540
  %17 = load i8, ptr %16, align 1, !dbg !540, !tbaa !109
  %18 = icmp eq i8 %15, %17, !dbg !541
    #dbg_value(i32 %13, !506, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !533)
  br i1 %18, label %9, label %19, !dbg !541

19:                                               ; preds = %12, %9
  %20 = phi i32 [ -889275714, %9 ], [ -1163220307, %12 ], !dbg !509
    #dbg_value(i32 %20, !505, !DIExpression(), !509)
    #dbg_value(i32 1056772, !451, !DIExpression(), !542)
    #dbg_value(i32 %20, !452, !DIExpression(), !542)
  store volatile i32 %20, ptr inttoptr (i32 1056772 to ptr), align 4, !dbg !544, !tbaa !307
    #dbg_value(i32 1056768, !504, !DIExpression(), !509)
    #dbg_value(i32 -559038737, !505, !DIExpression(), !509)
    #dbg_value(i32 1056768, !451, !DIExpression(), !545)
    #dbg_value(i32 -559038737, !452, !DIExpression(), !545)
  store volatile i32 -559038737, ptr inttoptr (i32 1056768 to ptr), align 8192, !dbg !547, !tbaa !307
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #6, !dbg !548
  ret i32 0, !dbg !548
}

attributes #0 = { nofree norecurse nosync nounwind optsize memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zknd,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zknd,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zknd,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
!56 = !DILocation(line: 51, column: 3, scope: !40)
!57 = !DILocation(line: 43, column: 11, scope: !58)
!58 = distinct !DILexicalBlock(scope: !51, file: !3, line: 43, column: 9)
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
!118 = !DILocation(line: 62, column: 15, scope: !78)
!119 = !DILocation(line: 0, scope: !78)
!120 = !DILocation(line: 63, column: 15, scope: !78)
!121 = !DILocation(line: 64, column: 15, scope: !78)
!122 = !DILocation(line: 65, column: 15, scope: !78)
!123 = !DILocation(line: 66, column: 11, scope: !85)
!124 = !DILocation(line: 66, column: 16, scope: !85)
!125 = !DILocation(line: 0, scope: !84)
!126 = !DILocation(line: 68, column: 17, scope: !84)
!127 = !DILocation(line: 69, column: 17, scope: !84)
!128 = !DILocation(line: 70, column: 17, scope: !84)
!129 = !DILocation(line: 71, column: 17, scope: !84)
!130 = !DILocation(line: 72, column: 26, scope: !84)
!131 = !DILocation(line: 72, column: 32, scope: !84)
!132 = !DILocation(line: 72, column: 18, scope: !84)
!133 = !DILocation(line: 72, column: 15, scope: !84)
!134 = !DILocation(line: 73, column: 5, scope: !84)
!135 = !DILocation(line: 74, column: 21, scope: !78)
!136 = !DILocation(line: 74, column: 40, scope: !78)
!137 = !DILocation(line: 74, column: 19, scope: !78)
!138 = !DILocation(line: 75, column: 25, scope: !78)
!139 = !DILocation(line: 75, column: 44, scope: !78)
!140 = !DILocation(line: 75, column: 18, scope: !78)
!141 = !DILocation(line: 75, column: 5, scope: !78)
!142 = !DILocation(line: 75, column: 23, scope: !78)
!143 = !DILocation(line: 76, column: 25, scope: !78)
!144 = !DILocation(line: 76, column: 44, scope: !78)
!145 = !DILocation(line: 76, column: 18, scope: !78)
!146 = !DILocation(line: 76, column: 5, scope: !78)
!147 = !DILocation(line: 76, column: 23, scope: !78)
!148 = !DILocation(line: 77, column: 25, scope: !78)
!149 = !DILocation(line: 77, column: 44, scope: !78)
!150 = !DILocation(line: 77, column: 18, scope: !78)
!151 = !DILocation(line: 77, column: 5, scope: !78)
!152 = !DILocation(line: 77, column: 23, scope: !78)
!153 = !DILocation(line: 60, column: 27, scope: !79)
!154 = !DILocation(line: 60, column: 18, scope: !79)
!155 = !DILocation(line: 60, column: 3, scope: !80)
!156 = distinct !{!156, !155, !157, !68}
!157 = !DILocation(line: 78, column: 3, scope: !80)
!158 = !DILocation(line: 92, column: 1, scope: !69)
!159 = !DILocation(line: 0, scope: !87)
!160 = !DILocation(line: 81, column: 22, scope: !91)
!161 = !DILocation(line: 0, scope: !91)
!162 = !DILocation(line: 0, scope: !94)
!163 = !DILocation(line: 82, column: 5, scope: !94)
!164 = !DILocation(line: 80, column: 35, scope: !92)
!165 = !DILocation(line: 80, column: 26, scope: !92)
!166 = !DILocation(line: 80, column: 3, scope: !87)
!167 = distinct !{!167, !166, !168, !68}
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
!182 = distinct !{!182, !163, !183, !68}
!183 = !DILocation(line: 90, column: 5, scope: !94)
!184 = !DILocation(line: 87, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !3, line: 85, column: 45)
!186 = distinct !DILexicalBlock(scope: !102, file: !3, line: 85, column: 7)
!187 = !DILocation(line: 0, scope: !40, inlinedAt: !188)
!188 = distinct !DILocation(line: 87, column: 13, scope: !185)
!189 = !DILocation(line: 0, scope: !48, inlinedAt: !188)
!190 = !DILocation(line: 42, column: 3, scope: !48, inlinedAt: !188)
!191 = !DILocation(line: 43, column: 11, scope: !58, inlinedAt: !188)
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
!205 = !DILocation(line: 43, column: 11, scope: !58, inlinedAt: !202)
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
!219 = !DILocation(line: 43, column: 11, scope: !58, inlinedAt: !216)
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
!234 = !DILocation(line: 43, column: 11, scope: !58, inlinedAt: !231)
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
!311 = !DILocation(line: 228, column: 3, scope: !271)
!312 = !{i64 9352}
!313 = !DILocation(line: 232, column: 3, scope: !271)
!314 = !{i64 9556}
!315 = !DILocation(line: 236, column: 3, scope: !271)
!316 = !{i64 9760}
!317 = !DILocation(line: 240, column: 3, scope: !271)
!318 = !{i64 9964}
!319 = !DILocation(line: 246, column: 27, scope: !271)
!320 = !DILocation(line: 245, column: 3, scope: !271)
!321 = !{i64 10170}
!322 = !DILocation(line: 249, column: 3, scope: !271)
!323 = !{i64 10374}
!324 = !DILocation(line: 253, column: 3, scope: !271)
!325 = !{i64 10578}
!326 = !DILocation(line: 257, column: 3, scope: !271)
!327 = !{i64 10782}
!328 = !DILocation(line: 263, column: 27, scope: !271)
!329 = !DILocation(line: 262, column: 3, scope: !271)
!330 = !{i64 10988}
!331 = !DILocation(line: 266, column: 3, scope: !271)
!332 = !{i64 11192}
!333 = !DILocation(line: 270, column: 3, scope: !271)
!334 = !{i64 11396}
!335 = !DILocation(line: 274, column: 3, scope: !271)
!336 = !{i64 11600}
!337 = !DILocation(line: 280, column: 27, scope: !271)
!338 = !DILocation(line: 279, column: 3, scope: !271)
!339 = !{i64 11806}
!340 = !DILocation(line: 283, column: 3, scope: !271)
!341 = !{i64 12010}
!342 = !DILocation(line: 287, column: 3, scope: !271)
!343 = !{i64 12214}
!344 = !DILocation(line: 291, column: 3, scope: !271)
!345 = !{i64 12418}
!346 = !DILocation(line: 296, column: 3, scope: !271)
!347 = !DILocation(line: 297, column: 1, scope: !271)
!348 = !DILocation(line: 0, scope: !285)
!349 = !DILocation(line: 163, column: 61, scope: !285)
!350 = !DILocation(line: 163, column: 44, scope: !285)
!351 = !DILocation(line: 165, column: 5, scope: !285)
!352 = !{i64 6135}
!353 = !DILocation(line: 170, column: 51, scope: !285)
!354 = !DILocation(line: 168, column: 5, scope: !285)
!355 = !{i64 6306}
!356 = !DILocation(line: 173, column: 51, scope: !285)
!357 = !DILocation(line: 171, column: 5, scope: !285)
!358 = !{i64 6477}
!359 = !DILocation(line: 176, column: 51, scope: !285)
!360 = !DILocation(line: 174, column: 5, scope: !285)
!361 = !{i64 6648}
!362 = !DILocation(line: 179, column: 29, scope: !285)
!363 = !DILocation(line: 178, column: 5, scope: !285)
!364 = !{i64 6821}
!365 = !DILocation(line: 181, column: 5, scope: !285)
!366 = !{i64 6992}
!367 = !DILocation(line: 184, column: 5, scope: !285)
!368 = !{i64 7163}
!369 = !DILocation(line: 187, column: 5, scope: !285)
!370 = !{i64 7334}
!371 = !DILocation(line: 192, column: 29, scope: !285)
!372 = !DILocation(line: 191, column: 5, scope: !285)
!373 = !{i64 7507}
!374 = !DILocation(line: 194, column: 5, scope: !285)
!375 = !{i64 7678}
!376 = !DILocation(line: 197, column: 5, scope: !285)
!377 = !{i64 7849}
!378 = !DILocation(line: 200, column: 5, scope: !285)
!379 = !{i64 8020}
!380 = !DILocation(line: 205, column: 29, scope: !285)
!381 = !DILocation(line: 204, column: 5, scope: !285)
!382 = !{i64 8193}
!383 = !DILocation(line: 207, column: 5, scope: !285)
!384 = !{i64 8364}
!385 = !DILocation(line: 210, column: 5, scope: !285)
!386 = !{i64 8535}
!387 = !DILocation(line: 213, column: 5, scope: !285)
!388 = !{i64 8706}
!389 = !DILocation(line: 217, column: 20, scope: !285)
!390 = !DILocation(line: 218, column: 20, scope: !285)
!391 = !DILocation(line: 218, column: 18, scope: !285)
!392 = !DILocation(line: 219, column: 20, scope: !285)
!393 = !DILocation(line: 219, column: 18, scope: !285)
!394 = !DILocation(line: 220, column: 18, scope: !285)
!395 = !DILocation(line: 161, column: 40, scope: !286)
!396 = !DILocation(line: 161, column: 29, scope: !286)
!397 = distinct !{!397, !310, !398, !68}
!398 = !DILocation(line: 221, column: 3, scope: !283)
!399 = distinct !DISubprogram(name: "aes128_ecb_decrypt", scope: !3, file: !3, line: 300, type: !400, scopeLine: 301, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !406)
!400 = !DISubroutineType(types: !401)
!401 = !{null, !72, !402, !72, !72}
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !403, line: 40, baseType: !404)
!403 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/strings.h", directory: "", checksumkind: CSK_MD5, checksum: "dceb1b71cd72987b246237af8552faba")
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "__size_t", file: !405, line: 131, baseType: !10)
!405 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "17b5691773b3e3881dfdbe392c9e8d43")
!406 = !{!407, !408, !409, !410, !411, !415, !416, !418}
!407 = !DILocalVariable(name: "plaintext", arg: 1, scope: !399, file: !3, line: 300, type: !72)
!408 = !DILocalVariable(name: "len", arg: 2, scope: !399, file: !3, line: 300, type: !402)
!409 = !DILocalVariable(name: "key", arg: 3, scope: !399, file: !3, line: 300, type: !72)
!410 = !DILocalVariable(name: "ciphertext", arg: 4, scope: !399, file: !3, line: 301, type: !72)
!411 = !DILocalVariable(name: "round_keys", scope: !399, file: !3, line: 308, type: !412)
!412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1408, elements: !413)
!413 = !{!414}
!414 = !DISubrange(count: 176)
!415 = !DILocalVariable(name: "copy_key", scope: !399, file: !3, line: 309, type: !412)
!416 = !DILocalVariable(name: "i", scope: !417, file: !3, line: 312, type: !402)
!417 = distinct !DILexicalBlock(scope: !399, file: !3, line: 312, column: 3)
!418 = !DILocalVariable(name: "z", scope: !419, file: !3, line: 313, type: !402)
!419 = distinct !DILexicalBlock(scope: !420, file: !3, line: 313, column: 5)
!420 = distinct !DILexicalBlock(scope: !421, file: !3, line: 312, column: 40)
!421 = distinct !DILexicalBlock(scope: !417, file: !3, line: 312, column: 3)
!422 = distinct !DIAssignID()
!423 = !DILocation(line: 0, scope: !399)
!424 = distinct !DIAssignID()
!425 = !DILocation(line: 302, column: 11, scope: !426)
!426 = distinct !DILexicalBlock(scope: !399, file: !3, line: 302, column: 7)
!427 = !DILocation(line: 302, column: 16, scope: !426)
!428 = !DILocation(line: 308, column: 3, scope: !399)
!429 = !DILocation(line: 309, column: 3, scope: !399)
!430 = !DILocation(line: 310, column: 3, scope: !399)
!431 = !DILocation(line: 0, scope: !417)
!432 = !DILocation(line: 312, column: 24, scope: !421)
!433 = !DILocation(line: 312, column: 3, scope: !417)
!434 = !DILocation(line: 0, scope: !419)
!435 = !DILocation(line: 314, column: 19, scope: !436)
!436 = distinct !DILexicalBlock(scope: !437, file: !3, line: 313, column: 38)
!437 = distinct !DILexicalBlock(scope: !419, file: !3, line: 313, column: 5)
!438 = !DILocation(line: 316, column: 27, scope: !420)
!439 = !DILocation(line: 316, column: 52, scope: !420)
!440 = !DILocation(line: 316, column: 5, scope: !420)
!441 = !DILocation(line: 312, column: 33, scope: !421)
!442 = distinct !{!442, !433, !443, !68}
!443 = !DILocation(line: 317, column: 3, scope: !417)
!444 = !DILocation(line: 318, column: 1, scope: !399)
!445 = distinct !DISubprogram(name: "write_to_address", scope: !3, file: !3, line: 320, type: !446, scopeLine: 320, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !450)
!446 = !DISubroutineType(types: !447)
!447 = !{null, !448, !6}
!448 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !7, line: 82, baseType: !449)
!449 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintptr_t", file: !9, line: 232, baseType: !10)
!450 = !{!451, !452}
!451 = !DILocalVariable(name: "addr", arg: 1, scope: !445, file: !3, line: 320, type: !448)
!452 = !DILocalVariable(name: "value", arg: 2, scope: !445, file: !3, line: 320, type: !6)
!453 = !DILocation(line: 0, scope: !445)
!454 = !DILocation(line: 321, column: 4, scope: !445)
!455 = !DILocation(line: 321, column: 30, scope: !445)
!456 = !DILocation(line: 322, column: 1, scope: !445)
!457 = distinct !DISubprogram(name: "write_v_to_address", scope: !3, file: !3, line: 324, type: !458, scopeLine: 324, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !460)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !448, !72}
!460 = !{!461, !462, !463, !464}
!461 = !DILocalVariable(name: "addr", arg: 1, scope: !457, file: !3, line: 324, type: !448)
!462 = !DILocalVariable(name: "vector", arg: 2, scope: !457, file: !3, line: 324, type: !72)
!463 = !DILocalVariable(name: "vector_word", scope: !457, file: !3, line: 325, type: !5)
!464 = !DILocalVariable(name: "i", scope: !465, file: !3, line: 326, type: !49)
!465 = distinct !DILexicalBlock(scope: !457, file: !3, line: 326, column: 3)
!466 = !DILocation(line: 0, scope: !457)
!467 = !DILocation(line: 0, scope: !465)
!468 = !DILocation(line: 326, column: 3, scope: !465)
!469 = !DILocation(line: 329, column: 1, scope: !457)
!470 = !DILocation(line: 327, column: 31, scope: !471)
!471 = distinct !DILexicalBlock(scope: !472, file: !3, line: 326, column: 31)
!472 = distinct !DILexicalBlock(scope: !465, file: !3, line: 326, column: 3)
!473 = !DILocation(line: 327, column: 27, scope: !471)
!474 = !DILocation(line: 327, column: 38, scope: !471)
!475 = !DILocation(line: 0, scope: !445, inlinedAt: !476)
!476 = distinct !DILocation(line: 327, column: 5, scope: !471)
!477 = !DILocation(line: 321, column: 4, scope: !445, inlinedAt: !476)
!478 = !DILocation(line: 321, column: 30, scope: !445, inlinedAt: !476)
!479 = !DILocation(line: 326, column: 27, scope: !472)
!480 = !DILocation(line: 326, column: 21, scope: !472)
!481 = distinct !{!481, !468, !482, !68}
!482 = !DILocation(line: 328, column: 3, scope: !465)
!483 = distinct !DISubprogram(name: "write_numb_to_address", scope: !3, file: !3, line: 331, type: !458, scopeLine: 331, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !484)
!484 = !{!485, !486, !487}
!485 = !DILocalVariable(name: "addr", arg: 1, scope: !483, file: !3, line: 331, type: !448)
!486 = !DILocalVariable(name: "vector", arg: 2, scope: !483, file: !3, line: 331, type: !72)
!487 = !DILocalVariable(name: "vector_word", scope: !483, file: !3, line: 332, type: !5)
!488 = !DILocation(line: 0, scope: !483)
!489 = !DILocation(line: 333, column: 26, scope: !483)
!490 = !DILocation(line: 0, scope: !445, inlinedAt: !491)
!491 = distinct !DILocation(line: 333, column: 3, scope: !483)
!492 = !DILocation(line: 321, column: 4, scope: !445, inlinedAt: !491)
!493 = !DILocation(line: 321, column: 30, scope: !445, inlinedAt: !491)
!494 = !DILocation(line: 334, column: 1, scope: !483)
!495 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 336, type: !496, scopeLine: 336, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !498)
!496 = !DISubroutineType(types: !497)
!497 = !{!49}
!498 = !{!499, !500, !501, !502, !503, !504, !505, !506}
!499 = !DILocalVariable(name: "ciphertext", scope: !495, file: !3, line: 340, type: !279)
!500 = !DILocalVariable(name: "key", scope: !495, file: !3, line: 344, type: !279)
!501 = !DILocalVariable(name: "expected_output", scope: !495, file: !3, line: 347, type: !279)
!502 = !DILocalVariable(name: "plaintext", scope: !495, file: !3, line: 350, type: !279)
!503 = !DILocalVariable(name: "len", scope: !495, file: !3, line: 351, type: !402)
!504 = !DILocalVariable(name: "addr", scope: !495, file: !3, line: 353, type: !448)
!505 = !DILocalVariable(name: "value", scope: !495, file: !3, line: 354, type: !6)
!506 = !DILocalVariable(name: "i", scope: !507, file: !3, line: 384, type: !49)
!507 = distinct !DILexicalBlock(scope: !495, file: !3, line: 384, column: 3)
!508 = distinct !DIAssignID()
!509 = !DILocation(line: 0, scope: !495)
!510 = distinct !DIAssignID()
!511 = distinct !DIAssignID()
!512 = distinct !DIAssignID()
!513 = distinct !DIAssignID()
!514 = distinct !DIAssignID()
!515 = distinct !DIAssignID()
!516 = !DILocation(line: 350, column: 3, scope: !495)
!517 = !DILocation(line: 356, column: 3, scope: !495)
!518 = !DILocation(line: 0, scope: !457, inlinedAt: !519)
!519 = distinct !DILocation(line: 359, column: 3, scope: !495)
!520 = !DILocation(line: 0, scope: !465, inlinedAt: !519)
!521 = !DILocation(line: 0, scope: !445, inlinedAt: !522)
!522 = distinct !DILocation(line: 327, column: 5, scope: !471, inlinedAt: !519)
!523 = !DILocation(line: 321, column: 30, scope: !445, inlinedAt: !522)
!524 = !DILocation(line: 0, scope: !465, inlinedAt: !525)
!525 = distinct !DILocation(line: 362, column: 3, scope: !495)
!526 = !DILocation(line: 327, column: 38, scope: !471, inlinedAt: !525)
!527 = !DILocation(line: 0, scope: !445, inlinedAt: !528)
!528 = distinct !DILocation(line: 327, column: 5, scope: !471, inlinedAt: !525)
!529 = !DILocation(line: 321, column: 30, scope: !445, inlinedAt: !528)
!530 = !DILocation(line: 384, column: 3, scope: !507)
!531 = !DILocation(line: 384, column: 28, scope: !532)
!532 = distinct !DILexicalBlock(scope: !507, file: !3, line: 384, column: 3)
!533 = !DILocation(line: 0, scope: !507)
!534 = !DILocation(line: 384, column: 21, scope: !532)
!535 = distinct !{!535, !530, !536, !68}
!536 = !DILocation(line: 389, column: 3, scope: !507)
!537 = !DILocation(line: 385, column: 9, scope: !538)
!538 = distinct !DILexicalBlock(scope: !539, file: !3, line: 385, column: 9)
!539 = distinct !DILexicalBlock(scope: !532, file: !3, line: 384, column: 32)
!540 = !DILocation(line: 385, column: 25, scope: !538)
!541 = !DILocation(line: 385, column: 22, scope: !538)
!542 = !DILocation(line: 0, scope: !445, inlinedAt: !543)
!543 = distinct !DILocation(line: 390, column: 3, scope: !495)
!544 = !DILocation(line: 321, column: 30, scope: !445, inlinedAt: !543)
!545 = !DILocation(line: 0, scope: !445, inlinedAt: !546)
!546 = distinct !DILocation(line: 396, column: 3, scope: !495)
!547 = !DILocation(line: 321, column: 30, scope: !445, inlinedAt: !546)
!548 = !DILocation(line: 399, column: 1, scope: !495)

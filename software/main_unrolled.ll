; ModuleID = 'main.ll'
source_filename = "main.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown"

@sbox = internal unnamed_addr constant [256 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB\E02:\0AI\06$\\\C2\D3\ACb\91\95\E4y\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8Ap>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16", align 1, !dbg !0
@rcon = internal unnamed_addr constant [10 x i8] c"\01\02\04\08\10 @\80\1B6", align 1, !dbg !14
@__const.main.plaintext = private unnamed_addr constant [16 x i8] c"Hello, World!000", align 1
@__const.main.key = private unnamed_addr constant [16 x i8] c"cese4040password", align 1
@__const.main.expected_output = private unnamed_addr constant [16 x i8] c"\14\09\A5\FB\1F\F4Kq\BE\AA%.\0F\08\F9\AA", align 1

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @expand_key(ptr nocapture noundef readonly %0, ptr nocapture noundef %1) local_unnamed_addr #0 !dbg !35 {
    #dbg_value(ptr %0, !40, !DIExpression(), !54)
    #dbg_value(ptr %1, !41, !DIExpression(), !54)
    #dbg_value(i32 0, !42, !DIExpression(), !54)
  br label %3, !dbg !55

3:                                                ; preds = %3, %2
  %4 = phi i32 [ 0, %2 ], [ %8, %3 ]
    #dbg_value(i32 %4, !42, !DIExpression(), !54)
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 %4, !dbg !57
  %6 = load i8, ptr %5, align 1, !dbg !57, !tbaa !60
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 %4, !dbg !63
  store i8 %6, ptr %7, align 1, !dbg !64, !tbaa !60
  %8 = add nuw nsw i32 %4, 1, !dbg !65
    #dbg_value(i32 %8, !42, !DIExpression(), !54)
  %9 = icmp eq i32 %8, 16, !dbg !66
  br i1 %9, label %.preheader, label %3, !dbg !55, !llvm.loop !67

.preheader:                                       ; preds = %3
  br label %10, !dbg !70

10:                                               ; preds = %.preheader, %41
  %11 = phi i32 [ %64, %41 ], [ 16, %.preheader ]
    #dbg_value(i32 %11, !42, !DIExpression(), !54)
  %12 = getelementptr i8, ptr %1, i32 %11, !dbg !71
  %13 = getelementptr i8, ptr %12, i32 -4, !dbg !71
  %14 = load i8, ptr %13, align 1, !dbg !71, !tbaa !60
    #dbg_value(i8 %14, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !72)
  %15 = getelementptr i8, ptr %12, i32 -3, !dbg !73
  %16 = load i8, ptr %15, align 1, !dbg !73, !tbaa !60
    #dbg_value(i8 %16, !44, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !72)
  %17 = getelementptr i8, ptr %12, i32 -2, !dbg !74
  %18 = load i8, ptr %17, align 1, !dbg !74, !tbaa !60
    #dbg_value(i8 %18, !44, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !72)
  %19 = getelementptr i8, ptr %12, i32 -1, !dbg !75
  %20 = load i8, ptr %19, align 1, !dbg !75, !tbaa !60
    #dbg_value(i8 %20, !44, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !72)
  %21 = and i32 %11, 12, !dbg !76
  %22 = icmp eq i32 %21, 0, !dbg !77
  br i1 %22, label %23, label %41, !dbg !77

23:                                               ; preds = %10
    #dbg_value(i8 %14, !51, !DIExpression(), !78)
  %24 = zext i8 %16 to i32, !dbg !79
  %25 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %24, !dbg !79
  %26 = load i8, ptr %25, align 1, !dbg !79, !tbaa !60
    #dbg_value(i8 %26, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !72)
  %27 = zext i8 %18 to i32, !dbg !80
  %28 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %27, !dbg !80
  %29 = load i8, ptr %28, align 1, !dbg !80, !tbaa !60
    #dbg_value(i8 %29, !44, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !72)
  %30 = zext i8 %20 to i32, !dbg !81
  %31 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %30, !dbg !81
  %32 = load i8, ptr %31, align 1, !dbg !81, !tbaa !60
    #dbg_value(i8 %32, !44, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !72)
  %33 = zext i8 %14 to i32, !dbg !82
  %34 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %33, !dbg !82
  %35 = load i8, ptr %34, align 1, !dbg !82, !tbaa !60
    #dbg_value(i8 %35, !44, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !72)
  %36 = lshr exact i32 %11, 4, !dbg !83
  %37 = add nsw i32 %36, -1, !dbg !84
  %38 = getelementptr inbounds [10 x i8], ptr @rcon, i32 0, i32 %37, !dbg !85
  %39 = load i8, ptr %38, align 1, !dbg !85, !tbaa !60
  %40 = xor i8 %39, %26, !dbg !86
    #dbg_value(i8 %40, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !72)
  br label %41, !dbg !87

41:                                               ; preds = %23, %10
  %42 = phi i8 [ %35, %23 ], [ %20, %10 ], !dbg !72
  %43 = phi i8 [ %32, %23 ], [ %18, %10 ], !dbg !72
  %44 = phi i8 [ %29, %23 ], [ %16, %10 ], !dbg !72
  %45 = phi i8 [ %40, %23 ], [ %14, %10 ], !dbg !72
    #dbg_value(i8 %45, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !72)
    #dbg_value(i8 %44, !44, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !72)
    #dbg_value(i8 %43, !44, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !72)
    #dbg_value(i8 %42, !44, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !72)
  %46 = getelementptr i8, ptr %12, i32 -16, !dbg !88
  %47 = load i8, ptr %46, align 1, !dbg !88, !tbaa !60
  %48 = xor i8 %47, %45, !dbg !89
  store i8 %48, ptr %12, align 1, !dbg !90, !tbaa !60
  %49 = getelementptr i8, ptr %12, i32 -15, !dbg !91
  %50 = load i8, ptr %49, align 1, !dbg !91, !tbaa !60
  %51 = xor i8 %50, %44, !dbg !92
  %52 = or disjoint i32 %11, 1, !dbg !93
  %53 = getelementptr inbounds nuw i8, ptr %1, i32 %52, !dbg !94
  store i8 %51, ptr %53, align 1, !dbg !95, !tbaa !60
  %54 = getelementptr i8, ptr %12, i32 -14, !dbg !96
  %55 = load i8, ptr %54, align 1, !dbg !96, !tbaa !60
  %56 = xor i8 %55, %43, !dbg !97
  %57 = or disjoint i32 %11, 2, !dbg !98
  %58 = getelementptr inbounds nuw i8, ptr %1, i32 %57, !dbg !99
  store i8 %56, ptr %58, align 1, !dbg !100, !tbaa !60
  %59 = getelementptr i8, ptr %12, i32 -13, !dbg !101
  %60 = load i8, ptr %59, align 1, !dbg !101, !tbaa !60
  %61 = xor i8 %60, %42, !dbg !102
  %62 = or disjoint i32 %11, 3, !dbg !103
  %63 = getelementptr inbounds nuw i8, ptr %1, i32 %62, !dbg !104
  store i8 %61, ptr %63, align 1, !dbg !105, !tbaa !60
  %64 = add nuw nsw i32 %11, 4, !dbg !106
    #dbg_value(i32 %64, !42, !DIExpression(), !54)
  %65 = icmp samesign ult i32 %11, 172, !dbg !107
  br i1 %65, label %10, label %66, !dbg !70, !llvm.loop !108

66:                                               ; preds = %41
  ret void, !dbg !110
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @sub_bytes(ptr nocapture noundef %0) local_unnamed_addr #0 !dbg !111 {
    #dbg_value(ptr %0, !115, !DIExpression(), !118)
    #dbg_value(i32 0, !116, !DIExpression(), !119)
  br label %3, !dbg !120

2:                                                ; preds = %3
  ret void, !dbg !121

3:                                                ; preds = %3, %1
  %4 = phi i32 [ 0, %1 ], [ %10, %3 ]
    #dbg_value(i32 %4, !116, !DIExpression(), !119)
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 %4, !dbg !122
  %6 = load i8, ptr %5, align 1, !dbg !122, !tbaa !60
  %7 = zext i8 %6 to i32, !dbg !125
  %8 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %7, !dbg !125
  %9 = load i8, ptr %8, align 1, !dbg !125, !tbaa !60
  store i8 %9, ptr %5, align 1, !dbg !126, !tbaa !60
  %10 = add nuw nsw i32 %4, 1, !dbg !127
    #dbg_value(i32 %10, !116, !DIExpression(), !119)
  %11 = icmp eq i32 %10, 16, !dbg !128
  br i1 %11, label %2, label %3, !dbg !120, !llvm.loop !129
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: readwrite)
define dso_local void @shift_rows(ptr nocapture noundef %0) local_unnamed_addr #2 !dbg !131 {
    #dbg_value(ptr %0, !133, !DIExpression(), !135)
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 1, !dbg !136
  %3 = load i8, ptr %2, align 1, !dbg !136, !tbaa !60
    #dbg_value(i8 %3, !134, !DIExpression(), !135)
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 5, !dbg !137
  %5 = load i8, ptr %4, align 1, !dbg !137, !tbaa !60
  store i8 %5, ptr %2, align 1, !dbg !138, !tbaa !60
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 9, !dbg !139
  %7 = load i8, ptr %6, align 1, !dbg !139, !tbaa !60
  store i8 %7, ptr %4, align 1, !dbg !140, !tbaa !60
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 13, !dbg !141
  %9 = load i8, ptr %8, align 1, !dbg !141, !tbaa !60
  store i8 %9, ptr %6, align 1, !dbg !142, !tbaa !60
  store i8 %3, ptr %8, align 1, !dbg !143, !tbaa !60
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 2, !dbg !144
  %11 = load i8, ptr %10, align 1, !dbg !144, !tbaa !60
    #dbg_value(i8 %11, !134, !DIExpression(), !135)
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 10, !dbg !145
  %13 = load i8, ptr %12, align 1, !dbg !145, !tbaa !60
  store i8 %13, ptr %10, align 1, !dbg !146, !tbaa !60
  store i8 %11, ptr %12, align 1, !dbg !147, !tbaa !60
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 6, !dbg !148
  %15 = load i8, ptr %14, align 1, !dbg !148, !tbaa !60
    #dbg_value(i8 %15, !134, !DIExpression(), !135)
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 14, !dbg !149
  %17 = load i8, ptr %16, align 1, !dbg !149, !tbaa !60
  store i8 %17, ptr %14, align 1, !dbg !150, !tbaa !60
  store i8 %15, ptr %16, align 1, !dbg !151, !tbaa !60
  %18 = getelementptr inbounds nuw i8, ptr %0, i32 15, !dbg !152
  %19 = load i8, ptr %18, align 1, !dbg !152, !tbaa !60
    #dbg_value(i8 %19, !134, !DIExpression(), !135)
  %20 = getelementptr inbounds nuw i8, ptr %0, i32 11, !dbg !153
  %21 = load i8, ptr %20, align 1, !dbg !153, !tbaa !60
  store i8 %21, ptr %18, align 1, !dbg !154, !tbaa !60
  %22 = getelementptr inbounds nuw i8, ptr %0, i32 7, !dbg !155
  %23 = load i8, ptr %22, align 1, !dbg !155, !tbaa !60
  store i8 %23, ptr %20, align 1, !dbg !156, !tbaa !60
  %24 = getelementptr inbounds nuw i8, ptr %0, i32 3, !dbg !157
  %25 = load i8, ptr %24, align 1, !dbg !157, !tbaa !60
  store i8 %25, ptr %22, align 1, !dbg !158, !tbaa !60
  store i8 %19, ptr %24, align 1, !dbg !159, !tbaa !60
  ret void, !dbg !160
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(none)
define dso_local zeroext i8 @gf_mult(i8 noundef zeroext %0, i8 noundef zeroext %1) local_unnamed_addr #3 !dbg !161 {
    #dbg_value(i8 %0, !165, !DIExpression(), !173)
    #dbg_value(i8 %1, !166, !DIExpression(), !173)
    #dbg_value(i8 0, !167, !DIExpression(), !173)
    #dbg_value(i32 0, !168, !DIExpression(), !174)
  br label %4, !dbg !175

3:                                                ; preds = %4
  %.lcssa = phi i8 [ %12, %4 ], !dbg !176
  ret i8 %.lcssa, !dbg !178

4:                                                ; preds = %4, %2
  %5 = phi i8 [ %0, %2 ], [ %16, %4 ]
  %6 = phi i32 [ 0, %2 ], [ %18, %4 ]
  %7 = phi i8 [ 0, %2 ], [ %12, %4 ]
  %8 = phi i8 [ %1, %2 ], [ %17, %4 ]
    #dbg_value(i8 %5, !165, !DIExpression(), !173)
    #dbg_value(i32 %6, !168, !DIExpression(), !174)
    #dbg_value(i8 %7, !167, !DIExpression(), !173)
    #dbg_value(i8 %8, !166, !DIExpression(), !173)
  %9 = and i8 %8, 1, !dbg !176
  %10 = icmp eq i8 %9, 0, !dbg !176
  %11 = select i1 %10, i8 0, i8 %5, !dbg !176
  %12 = xor i8 %11, %7, !dbg !176
    #dbg_value(i8 %12, !167, !DIExpression(), !173)
    #dbg_value(i8 %5, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !179)
  %13 = shl i8 %5, 1, !dbg !180
    #dbg_value(i8 %13, !165, !DIExpression(), !173)
  %14 = xor i8 %13, 27, !dbg !181
  %15 = icmp slt i8 %5, 0, !dbg !181
  %16 = select i1 %15, i8 %14, i8 %13, !dbg !181
    #dbg_value(i8 %16, !165, !DIExpression(), !173)
  %17 = lshr i8 %8, 1, !dbg !183
    #dbg_value(i8 %17, !166, !DIExpression(), !173)
  %18 = add nuw nsw i32 %6, 1, !dbg !184
    #dbg_value(i32 %18, !168, !DIExpression(), !174)
  %19 = icmp eq i32 %18, 8, !dbg !185
  br i1 %19, label %3, label %4, !dbg !175, !llvm.loop !186
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @mix_columns(ptr nocapture noundef %0) local_unnamed_addr #0 !dbg !188 {
  %2 = alloca [16 x i8], align 1, !DIAssignID !202
    #dbg_assign(i1 undef, !191, !DIExpression(), !202, ptr %2, !DIExpression(), !203)
    #dbg_value(ptr %0, !190, !DIExpression(), !203)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #7, !dbg !204
    #dbg_value(i32 0, !195, !DIExpression(), !205)
  br label %3, !dbg !206

3:                                                ; preds = %162, %1
  %4 = phi i32 [ 0, %1 ], [ %167, %162 ]
    #dbg_value(i32 %4, !195, !DIExpression(), !205)
  %5 = shl nuw nsw i32 %4, 2, !dbg !207
    #dbg_value(i32 %5, !197, !DIExpression(), !208)
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 %5, !dbg !209
  %7 = load i8, ptr %6, align 1, !dbg !209, !tbaa !60
    #dbg_value(i8 2, !165, !DIExpression(), !210)
    #dbg_value(i8 %7, !166, !DIExpression(), !210)
    #dbg_value(i8 0, !167, !DIExpression(), !210)
    #dbg_value(i32 0, !168, !DIExpression(), !212)
  br label %8, !dbg !213

8:                                                ; preds = %8, %3
  %9 = phi i8 [ 2, %3 ], [ %20, %8 ]
  %10 = phi i32 [ 0, %3 ], [ %22, %8 ]
  %11 = phi i8 [ 0, %3 ], [ %16, %8 ]
  %12 = phi i8 [ %7, %3 ], [ %21, %8 ]
    #dbg_value(i8 %9, !165, !DIExpression(), !210)
    #dbg_value(i32 %10, !168, !DIExpression(), !212)
    #dbg_value(i8 %11, !167, !DIExpression(), !210)
    #dbg_value(i8 %12, !166, !DIExpression(), !210)
  %13 = and i8 %12, 1, !dbg !214
  %14 = icmp eq i8 %13, 0, !dbg !214
  %15 = select i1 %14, i8 0, i8 %9, !dbg !214
  %16 = xor i8 %15, %11, !dbg !214
    #dbg_value(i8 %16, !167, !DIExpression(), !210)
    #dbg_value(i8 %9, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !215)
  %17 = shl i8 %9, 1, !dbg !216
    #dbg_value(i8 %17, !165, !DIExpression(), !210)
  %18 = xor i8 %17, 27, !dbg !217
  %19 = icmp slt i8 %9, 0, !dbg !217
  %20 = select i1 %19, i8 %18, i8 %17, !dbg !217
    #dbg_value(i8 %20, !165, !DIExpression(), !210)
  %21 = lshr i8 %12, 1, !dbg !218
    #dbg_value(i8 %21, !166, !DIExpression(), !210)
  %22 = add nuw nsw i32 %10, 1, !dbg !219
    #dbg_value(i32 %22, !168, !DIExpression(), !212)
  %23 = icmp eq i32 %22, 8, !dbg !220
  br i1 %23, label %24, label %8, !dbg !213, !llvm.loop !221

24:                                               ; preds = %8
  %.lcssa = phi i8 [ %16, %8 ], !dbg !214
  %25 = or disjoint i32 %5, 1, !dbg !223
  %26 = getelementptr inbounds nuw i8, ptr %0, i32 %25, !dbg !224
  %27 = load i8, ptr %26, align 1, !dbg !224, !tbaa !60
    #dbg_value(i8 3, !165, !DIExpression(), !225)
    #dbg_value(i8 %27, !166, !DIExpression(), !225)
    #dbg_value(i8 0, !167, !DIExpression(), !225)
    #dbg_value(i32 0, !168, !DIExpression(), !227)
  br label %28, !dbg !228

28:                                               ; preds = %28, %24
  %29 = phi i8 [ 3, %24 ], [ %40, %28 ]
  %30 = phi i32 [ 0, %24 ], [ %42, %28 ]
  %31 = phi i8 [ 0, %24 ], [ %36, %28 ]
  %32 = phi i8 [ %27, %24 ], [ %41, %28 ]
    #dbg_value(i8 %29, !165, !DIExpression(), !225)
    #dbg_value(i32 %30, !168, !DIExpression(), !227)
    #dbg_value(i8 %31, !167, !DIExpression(), !225)
    #dbg_value(i8 %32, !166, !DIExpression(), !225)
  %33 = and i8 %32, 1, !dbg !229
  %34 = icmp eq i8 %33, 0, !dbg !229
  %35 = select i1 %34, i8 0, i8 %29, !dbg !229
  %36 = xor i8 %35, %31, !dbg !229
    #dbg_value(i8 %36, !167, !DIExpression(), !225)
    #dbg_value(i8 %29, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !230)
  %37 = shl i8 %29, 1, !dbg !231
    #dbg_value(i8 %37, !165, !DIExpression(), !225)
  %38 = xor i8 %37, 27, !dbg !232
  %39 = icmp slt i8 %29, 0, !dbg !232
  %40 = select i1 %39, i8 %38, i8 %37, !dbg !232
    #dbg_value(i8 %40, !165, !DIExpression(), !225)
  %41 = lshr i8 %32, 1, !dbg !233
    #dbg_value(i8 %41, !166, !DIExpression(), !225)
  %42 = add nuw nsw i32 %30, 1, !dbg !234
    #dbg_value(i32 %42, !168, !DIExpression(), !227)
  %43 = icmp eq i32 %42, 8, !dbg !235
  br i1 %43, label %44, label %28, !dbg !228, !llvm.loop !236

44:                                               ; preds = %28
  %.lcssa2 = phi i8 [ %36, %28 ], !dbg !229
  %45 = xor i8 %.lcssa2, %.lcssa, !dbg !238
  %46 = or disjoint i32 %5, 2, !dbg !239
  %47 = getelementptr inbounds nuw i8, ptr %0, i32 %46, !dbg !240
  %48 = load i8, ptr %47, align 1, !dbg !240, !tbaa !60
  %49 = xor i8 %45, %48, !dbg !241
  %50 = or disjoint i32 %5, 3, !dbg !242
  %51 = getelementptr inbounds nuw i8, ptr %0, i32 %50, !dbg !243
  %52 = load i8, ptr %51, align 1, !dbg !243, !tbaa !60
  %53 = xor i8 %49, %52, !dbg !244
  %54 = getelementptr inbounds nuw [16 x i8], ptr %2, i32 0, i32 %5, !dbg !245
  store i8 %53, ptr %54, align 1, !dbg !246, !tbaa !60
    #dbg_value(i8 2, !165, !DIExpression(), !247)
    #dbg_value(i8 %27, !166, !DIExpression(), !247)
    #dbg_value(i8 0, !167, !DIExpression(), !247)
    #dbg_value(i32 0, !168, !DIExpression(), !249)
  br label %55, !dbg !250

55:                                               ; preds = %55, %44
  %56 = phi i8 [ 2, %44 ], [ %67, %55 ]
  %57 = phi i32 [ 0, %44 ], [ %69, %55 ]
  %58 = phi i8 [ 0, %44 ], [ %63, %55 ]
  %59 = phi i8 [ %27, %44 ], [ %68, %55 ]
    #dbg_value(i8 %56, !165, !DIExpression(), !247)
    #dbg_value(i32 %57, !168, !DIExpression(), !249)
    #dbg_value(i8 %58, !167, !DIExpression(), !247)
    #dbg_value(i8 %59, !166, !DIExpression(), !247)
  %60 = and i8 %59, 1, !dbg !251
  %61 = icmp eq i8 %60, 0, !dbg !251
  %62 = select i1 %61, i8 0, i8 %56, !dbg !251
  %63 = xor i8 %62, %58, !dbg !251
    #dbg_value(i8 %63, !167, !DIExpression(), !247)
    #dbg_value(i8 %56, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !252)
  %64 = shl i8 %56, 1, !dbg !253
    #dbg_value(i8 %64, !165, !DIExpression(), !247)
  %65 = xor i8 %64, 27, !dbg !254
  %66 = icmp slt i8 %56, 0, !dbg !254
  %67 = select i1 %66, i8 %65, i8 %64, !dbg !254
    #dbg_value(i8 %67, !165, !DIExpression(), !247)
  %68 = lshr i8 %59, 1, !dbg !255
    #dbg_value(i8 %68, !166, !DIExpression(), !247)
  %69 = add nuw nsw i32 %57, 1, !dbg !256
    #dbg_value(i32 %69, !168, !DIExpression(), !249)
  %70 = icmp eq i32 %69, 8, !dbg !257
  br i1 %70, label %.preheader1, label %55, !dbg !250, !llvm.loop !258

.preheader1:                                      ; preds = %55
  %.lcssa3 = phi i8 [ %63, %55 ], !dbg !251
  br label %71, !dbg !260

71:                                               ; preds = %.preheader1, %71
  %72 = phi i8 [ %83, %71 ], [ 3, %.preheader1 ]
  %73 = phi i32 [ %85, %71 ], [ 0, %.preheader1 ]
  %74 = phi i8 [ %79, %71 ], [ 0, %.preheader1 ]
  %75 = phi i8 [ %84, %71 ], [ %48, %.preheader1 ]
    #dbg_value(i8 %72, !165, !DIExpression(), !262)
    #dbg_value(i32 %73, !168, !DIExpression(), !263)
    #dbg_value(i8 %74, !167, !DIExpression(), !262)
    #dbg_value(i8 %75, !166, !DIExpression(), !262)
  %76 = and i8 %75, 1, !dbg !264
  %77 = icmp eq i8 %76, 0, !dbg !264
  %78 = select i1 %77, i8 0, i8 %72, !dbg !264
  %79 = xor i8 %78, %74, !dbg !264
    #dbg_value(i8 %79, !167, !DIExpression(), !262)
    #dbg_value(i8 %72, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !265)
  %80 = shl i8 %72, 1, !dbg !266
    #dbg_value(i8 %80, !165, !DIExpression(), !262)
  %81 = xor i8 %80, 27, !dbg !267
  %82 = icmp slt i8 %72, 0, !dbg !267
  %83 = select i1 %82, i8 %81, i8 %80, !dbg !267
    #dbg_value(i8 %83, !165, !DIExpression(), !262)
  %84 = lshr i8 %75, 1, !dbg !268
    #dbg_value(i8 %84, !166, !DIExpression(), !262)
  %85 = add nuw nsw i32 %73, 1, !dbg !269
    #dbg_value(i32 %85, !168, !DIExpression(), !263)
  %86 = icmp eq i32 %85, 8, !dbg !270
  br i1 %86, label %87, label %71, !dbg !260, !llvm.loop !271

87:                                               ; preds = %71
  %.lcssa4 = phi i8 [ %79, %71 ], !dbg !264
  %88 = xor i8 %52, %7, !dbg !273
  %89 = xor i8 %88, %.lcssa3, !dbg !274
  %90 = xor i8 %89, %.lcssa4, !dbg !275
  %91 = getelementptr inbounds nuw [16 x i8], ptr %2, i32 0, i32 %25, !dbg !276
  store i8 %90, ptr %91, align 1, !dbg !277, !tbaa !60
    #dbg_value(i8 2, !165, !DIExpression(), !278)
    #dbg_value(i8 %48, !166, !DIExpression(), !278)
    #dbg_value(i8 0, !167, !DIExpression(), !278)
    #dbg_value(i32 0, !168, !DIExpression(), !280)
  br label %92, !dbg !281

92:                                               ; preds = %92, %87
  %93 = phi i8 [ 2, %87 ], [ %104, %92 ]
  %94 = phi i32 [ 0, %87 ], [ %106, %92 ]
  %95 = phi i8 [ 0, %87 ], [ %100, %92 ]
  %96 = phi i8 [ %48, %87 ], [ %105, %92 ]
    #dbg_value(i8 %93, !165, !DIExpression(), !278)
    #dbg_value(i32 %94, !168, !DIExpression(), !280)
    #dbg_value(i8 %95, !167, !DIExpression(), !278)
    #dbg_value(i8 %96, !166, !DIExpression(), !278)
  %97 = and i8 %96, 1, !dbg !282
  %98 = icmp eq i8 %97, 0, !dbg !282
  %99 = select i1 %98, i8 0, i8 %93, !dbg !282
  %100 = xor i8 %99, %95, !dbg !282
    #dbg_value(i8 %100, !167, !DIExpression(), !278)
    #dbg_value(i8 %93, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !283)
  %101 = shl i8 %93, 1, !dbg !284
    #dbg_value(i8 %101, !165, !DIExpression(), !278)
  %102 = xor i8 %101, 27, !dbg !285
  %103 = icmp slt i8 %93, 0, !dbg !285
  %104 = select i1 %103, i8 %102, i8 %101, !dbg !285
    #dbg_value(i8 %104, !165, !DIExpression(), !278)
  %105 = lshr i8 %96, 1, !dbg !286
    #dbg_value(i8 %105, !166, !DIExpression(), !278)
  %106 = add nuw nsw i32 %94, 1, !dbg !287
    #dbg_value(i32 %106, !168, !DIExpression(), !280)
  %107 = icmp eq i32 %106, 8, !dbg !288
  br i1 %107, label %108, label %92, !dbg !281, !llvm.loop !289

108:                                              ; preds = %92
  %.lcssa5 = phi i8 [ %100, %92 ], !dbg !282
  %109 = xor i8 %27, %7, !dbg !291
    #dbg_value(i8 3, !165, !DIExpression(), !292)
    #dbg_value(i8 %52, !166, !DIExpression(), !292)
    #dbg_value(i8 0, !167, !DIExpression(), !292)
    #dbg_value(i32 0, !168, !DIExpression(), !294)
  br label %110, !dbg !295

110:                                              ; preds = %110, %108
  %111 = phi i8 [ 3, %108 ], [ %122, %110 ]
  %112 = phi i32 [ 0, %108 ], [ %124, %110 ]
  %113 = phi i8 [ 0, %108 ], [ %118, %110 ]
  %114 = phi i8 [ %52, %108 ], [ %123, %110 ]
    #dbg_value(i8 %111, !165, !DIExpression(), !292)
    #dbg_value(i32 %112, !168, !DIExpression(), !294)
    #dbg_value(i8 %113, !167, !DIExpression(), !292)
    #dbg_value(i8 %114, !166, !DIExpression(), !292)
  %115 = and i8 %114, 1, !dbg !296
  %116 = icmp eq i8 %115, 0, !dbg !296
  %117 = select i1 %116, i8 0, i8 %111, !dbg !296
  %118 = xor i8 %117, %113, !dbg !296
    #dbg_value(i8 %118, !167, !DIExpression(), !292)
    #dbg_value(i8 %111, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !297)
  %119 = shl i8 %111, 1, !dbg !298
    #dbg_value(i8 %119, !165, !DIExpression(), !292)
  %120 = xor i8 %119, 27, !dbg !299
  %121 = icmp slt i8 %111, 0, !dbg !299
  %122 = select i1 %121, i8 %120, i8 %119, !dbg !299
    #dbg_value(i8 %122, !165, !DIExpression(), !292)
  %123 = lshr i8 %114, 1, !dbg !300
    #dbg_value(i8 %123, !166, !DIExpression(), !292)
  %124 = add nuw nsw i32 %112, 1, !dbg !301
    #dbg_value(i32 %124, !168, !DIExpression(), !294)
  %125 = icmp eq i32 %124, 8, !dbg !302
  br i1 %125, label %126, label %110, !dbg !295, !llvm.loop !303

126:                                              ; preds = %110
  %.lcssa6 = phi i8 [ %118, %110 ], !dbg !296
  %127 = xor i8 %109, %.lcssa5, !dbg !305
  %128 = xor i8 %127, %.lcssa6, !dbg !306
  %129 = getelementptr inbounds nuw [16 x i8], ptr %2, i32 0, i32 %46, !dbg !307
  store i8 %128, ptr %129, align 1, !dbg !308, !tbaa !60
    #dbg_value(i8 3, !165, !DIExpression(), !309)
    #dbg_value(i8 %7, !166, !DIExpression(), !309)
    #dbg_value(i8 0, !167, !DIExpression(), !309)
    #dbg_value(i32 0, !168, !DIExpression(), !311)
  br label %130, !dbg !312

130:                                              ; preds = %130, %126
  %131 = phi i8 [ 3, %126 ], [ %142, %130 ]
  %132 = phi i32 [ 0, %126 ], [ %144, %130 ]
  %133 = phi i8 [ 0, %126 ], [ %138, %130 ]
  %134 = phi i8 [ %7, %126 ], [ %143, %130 ]
    #dbg_value(i8 %131, !165, !DIExpression(), !309)
    #dbg_value(i32 %132, !168, !DIExpression(), !311)
    #dbg_value(i8 %133, !167, !DIExpression(), !309)
    #dbg_value(i8 %134, !166, !DIExpression(), !309)
  %135 = and i8 %134, 1, !dbg !313
  %136 = icmp eq i8 %135, 0, !dbg !313
  %137 = select i1 %136, i8 0, i8 %131, !dbg !313
  %138 = xor i8 %137, %133, !dbg !313
    #dbg_value(i8 %138, !167, !DIExpression(), !309)
    #dbg_value(i8 %131, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !314)
  %139 = shl i8 %131, 1, !dbg !315
    #dbg_value(i8 %139, !165, !DIExpression(), !309)
  %140 = xor i8 %139, 27, !dbg !316
  %141 = icmp slt i8 %131, 0, !dbg !316
  %142 = select i1 %141, i8 %140, i8 %139, !dbg !316
    #dbg_value(i8 %142, !165, !DIExpression(), !309)
  %143 = lshr i8 %134, 1, !dbg !317
    #dbg_value(i8 %143, !166, !DIExpression(), !309)
  %144 = add nuw nsw i32 %132, 1, !dbg !318
    #dbg_value(i32 %144, !168, !DIExpression(), !311)
  %145 = icmp eq i32 %144, 8, !dbg !319
  br i1 %145, label %.preheader, label %130, !dbg !312, !llvm.loop !320

.preheader:                                       ; preds = %130
  %.lcssa7 = phi i8 [ %138, %130 ], !dbg !313
  br label %146, !dbg !322

146:                                              ; preds = %.preheader, %146
  %147 = phi i8 [ %158, %146 ], [ 2, %.preheader ]
  %148 = phi i32 [ %160, %146 ], [ 0, %.preheader ]
  %149 = phi i8 [ %154, %146 ], [ 0, %.preheader ]
  %150 = phi i8 [ %159, %146 ], [ %52, %.preheader ]
    #dbg_value(i8 %147, !165, !DIExpression(), !324)
    #dbg_value(i32 %148, !168, !DIExpression(), !325)
    #dbg_value(i8 %149, !167, !DIExpression(), !324)
    #dbg_value(i8 %150, !166, !DIExpression(), !324)
  %151 = and i8 %150, 1, !dbg !326
  %152 = icmp eq i8 %151, 0, !dbg !326
  %153 = select i1 %152, i8 0, i8 %147, !dbg !326
  %154 = xor i8 %153, %149, !dbg !326
    #dbg_value(i8 %154, !167, !DIExpression(), !324)
    #dbg_value(i8 %147, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !327)
  %155 = shl i8 %147, 1, !dbg !328
    #dbg_value(i8 %155, !165, !DIExpression(), !324)
  %156 = xor i8 %155, 27, !dbg !329
  %157 = icmp slt i8 %147, 0, !dbg !329
  %158 = select i1 %157, i8 %156, i8 %155, !dbg !329
    #dbg_value(i8 %158, !165, !DIExpression(), !324)
  %159 = lshr i8 %150, 1, !dbg !330
    #dbg_value(i8 %159, !166, !DIExpression(), !324)
  %160 = add nuw nsw i32 %148, 1, !dbg !331
    #dbg_value(i32 %160, !168, !DIExpression(), !325)
  %161 = icmp eq i32 %160, 8, !dbg !332
  br i1 %161, label %162, label %146, !dbg !322, !llvm.loop !333

162:                                              ; preds = %146
  %.lcssa8 = phi i8 [ %154, %146 ], !dbg !326
  %163 = xor i8 %48, %27, !dbg !335
  %164 = xor i8 %163, %.lcssa7, !dbg !336
  %165 = xor i8 %164, %.lcssa8, !dbg !337
  %166 = getelementptr inbounds nuw [16 x i8], ptr %2, i32 0, i32 %50, !dbg !338
  store i8 %165, ptr %166, align 1, !dbg !339, !tbaa !60
  %167 = add nuw nsw i32 %4, 1, !dbg !340
    #dbg_value(i32 %167, !195, !DIExpression(), !205)
  %168 = icmp eq i32 %167, 4, !dbg !341
  br i1 %168, label %169, label %3, !dbg !206, !llvm.loop !342

169:                                              ; preds = %162
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %0, ptr noundef nonnull align 1 dereferenceable(16) %2, i32 16, i1 false), !dbg !344, !tbaa !60
    #dbg_value(i32 poison, !200, !DIExpression(), !347)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #7, !dbg !348
  ret void, !dbg !348
}

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @add_round_key(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 !dbg !349 {
    #dbg_value(ptr %0, !351, !DIExpression(), !355)
    #dbg_value(ptr %1, !352, !DIExpression(), !355)
    #dbg_value(i32 0, !353, !DIExpression(), !356)
  br label %4, !dbg !357

3:                                                ; preds = %4
  ret void, !dbg !358

4:                                                ; preds = %4, %2
  %5 = phi i32 [ 0, %2 ], [ %11, %4 ]
    #dbg_value(i32 %5, !353, !DIExpression(), !356)
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 %5, !dbg !359
  %7 = load i8, ptr %6, align 1, !dbg !359, !tbaa !60
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 %5, !dbg !362
  %9 = load i8, ptr %8, align 1, !dbg !363, !tbaa !60
  %10 = xor i8 %9, %7, !dbg !363
  store i8 %10, ptr %8, align 1, !dbg !363, !tbaa !60
  %11 = add nuw nsw i32 %5, 1, !dbg !364
    #dbg_value(i32 %11, !353, !DIExpression(), !356)
  %12 = icmp eq i32 %11, 16, !dbg !365
  br i1 %12, label %3, label %4, !dbg !357, !llvm.loop !366
}

; Function Attrs: nounwind optsize
define dso_local void @aes128_encrypt_block(ptr nocapture noundef readonly %0, ptr nocapture noundef %1, ptr nocapture noundef writeonly %2) local_unnamed_addr #4 !dbg !368 {
  %4 = alloca [16 x i8], align 1, !DIAssignID !384
    #dbg_assign(i1 undef, !375, !DIExpression(), !384, ptr %4, !DIExpression(), !385)
    #dbg_value(ptr %0, !372, !DIExpression(), !385)
    #dbg_value(ptr %1, !373, !DIExpression(), !385)
    #dbg_value(ptr %2, !374, !DIExpression(), !385)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #7, !dbg !386
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %4, ptr noundef nonnull align 1 dereferenceable(16) %0, i32 16, i1 false), !dbg !387, !DIAssignID !388
    #dbg_assign(i1 undef, !375, !DIExpression(), !388, ptr %4, !DIExpression(), !385)
    #dbg_value(ptr %4, !351, !DIExpression(), !389)
    #dbg_value(ptr %1, !352, !DIExpression(), !389)
    #dbg_value(i32 0, !353, !DIExpression(), !391)
  br label %5, !dbg !392

5:                                                ; preds = %5, %3
  %6 = phi i32 [ 0, %3 ], [ %12, %5 ]
    #dbg_value(i32 %6, !353, !DIExpression(), !391)
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 %6, !dbg !393
  %8 = load i8, ptr %7, align 1, !dbg !393, !tbaa !60
  %9 = getelementptr inbounds nuw i8, ptr %4, i32 %6, !dbg !394
  %10 = load i8, ptr %9, align 1, !dbg !395, !tbaa !60
  %11 = xor i8 %10, %8, !dbg !395
  store i8 %11, ptr %9, align 1, !dbg !395, !tbaa !60
  %12 = add nuw nsw i32 %6, 1, !dbg !396
    #dbg_value(i32 %12, !353, !DIExpression(), !391)
  %13 = icmp eq i32 %12, 16, !dbg !397
  br i1 %13, label %14, label %5, !dbg !392, !llvm.loop !398

14:                                               ; preds = %5
  %15 = load i32, ptr %4, align 4, !tbaa !400
    #dbg_value(i32 1, !376, !DIExpression(), !402)
  %16 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %17 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %18 = getelementptr inbounds nuw i8, ptr %4, i32 12
  br label %19, !dbg !403

19:                                               ; preds = %14
    #dbg_value(i32 1, !376, !DIExpression(), !402)
    #dbg_value(ptr %4, !378, !DIExpression(), !404)
  %20 = getelementptr inbounds nuw i8, ptr %1, i32 16, !dbg !405
    #dbg_value(ptr %20, !381, !DIExpression(), !404)
  %21 = load i32, ptr %20, align 4, !dbg !406, !tbaa !400
  %22 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %21, i32 %15, i32 0, i32 %21) #7, !dbg !406, !srcloc !407
  store i32 %22, ptr %20, align 4, !dbg !406, !tbaa !400
  %23 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %24 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %22, i32 %23, i32 1, i32 %22) #7, !dbg !409, !srcloc !410
  store i32 %24, ptr %20, align 4, !dbg !409, !tbaa !400
  %25 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %26 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %24, i32 %25, i32 2, i32 %24) #7, !dbg !412, !srcloc !413
  store i32 %26, ptr %20, align 4, !dbg !412, !tbaa !400
  %27 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %28 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %26, i32 %27, i32 3, i32 %26) #7, !dbg !415, !srcloc !416
  store i32 %28, ptr %20, align 4, !dbg !415, !tbaa !400
  %29 = getelementptr inbounds nuw i8, ptr %20, i32 4, !dbg !417
  %30 = load i32, ptr %29, align 4, !dbg !418, !tbaa !400
  %31 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %30, i32 %23, i32 0, i32 %30) #7, !dbg !418, !srcloc !419
  store i32 %31, ptr %29, align 4, !dbg !418, !tbaa !400
  %32 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %31, i32 %25, i32 1, i32 %31) #7, !dbg !420, !srcloc !421
  store i32 %32, ptr %29, align 4, !dbg !420, !tbaa !400
  %33 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %32, i32 %27, i32 2, i32 %32) #7, !dbg !422, !srcloc !423
  store i32 %33, ptr %29, align 4, !dbg !422, !tbaa !400
  %34 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %33, i32 %15, i32 3, i32 %33) #7, !dbg !424, !srcloc !425
  store i32 %34, ptr %29, align 4, !dbg !424, !tbaa !400
  %35 = getelementptr inbounds nuw i8, ptr %20, i32 8, !dbg !426
  %36 = load i32, ptr %35, align 4, !dbg !427, !tbaa !400
  %37 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %36, i32 %25, i32 0, i32 %36) #7, !dbg !427, !srcloc !428
  store i32 %37, ptr %35, align 4, !dbg !427, !tbaa !400
  %38 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %37, i32 %27, i32 1, i32 %37) #7, !dbg !429, !srcloc !430
  store i32 %38, ptr %35, align 4, !dbg !429, !tbaa !400
  %39 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %38, i32 %15, i32 2, i32 %38) #7, !dbg !431, !srcloc !432
  store i32 %39, ptr %35, align 4, !dbg !431, !tbaa !400
  %40 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %39, i32 %23, i32 3, i32 %39) #7, !dbg !433, !srcloc !434
  store i32 %40, ptr %35, align 4, !dbg !433, !tbaa !400
  %41 = getelementptr inbounds nuw i8, ptr %20, i32 12, !dbg !435
  %42 = load i32, ptr %41, align 4, !dbg !436, !tbaa !400
  %43 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %42, i32 %27, i32 0, i32 %42) #7, !dbg !436, !srcloc !437
  store i32 %43, ptr %41, align 4, !dbg !436, !tbaa !400
  %44 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %43, i32 %15, i32 1, i32 %43) #7, !dbg !438, !srcloc !439
  store i32 %44, ptr %41, align 4, !dbg !438, !tbaa !400
  %45 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %44, i32 %23, i32 2, i32 %44) #7, !dbg !440, !srcloc !441
  store i32 %45, ptr %41, align 4, !dbg !440, !tbaa !400
  %46 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %45, i32 %25, i32 3, i32 %45) #7, !dbg !442, !srcloc !443
  store i32 %46, ptr %41, align 4, !dbg !442, !tbaa !400
  %47 = load i32, ptr %20, align 4, !dbg !444, !tbaa !400
  %48 = load i32, ptr %29, align 4, !dbg !445, !tbaa !400
  store i32 %48, ptr %16, align 4, !dbg !446, !tbaa !400
  %49 = load i32, ptr %35, align 4, !dbg !447, !tbaa !400
  store i32 %49, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %46, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 2, !376, !DIExpression(), !402)
  %50 = getelementptr inbounds nuw i8, ptr %1, i32 32, !dbg !405
    #dbg_value(ptr %50, !381, !DIExpression(), !404)
  %51 = load i32, ptr %50, align 4, !dbg !406, !tbaa !400
  %52 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %51, i32 %47, i32 0, i32 %51) #7, !dbg !406, !srcloc !407
  store i32 %52, ptr %50, align 4, !dbg !406, !tbaa !400
  %53 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %54 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %52, i32 %53, i32 1, i32 %52) #7, !dbg !409, !srcloc !410
  store i32 %54, ptr %50, align 4, !dbg !409, !tbaa !400
  %55 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %56 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %54, i32 %55, i32 2, i32 %54) #7, !dbg !412, !srcloc !413
  store i32 %56, ptr %50, align 4, !dbg !412, !tbaa !400
  %57 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %58 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %56, i32 %57, i32 3, i32 %56) #7, !dbg !415, !srcloc !416
  store i32 %58, ptr %50, align 4, !dbg !415, !tbaa !400
  %59 = getelementptr inbounds nuw i8, ptr %50, i32 4, !dbg !417
  %60 = load i32, ptr %59, align 4, !dbg !418, !tbaa !400
  %61 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %60, i32 %53, i32 0, i32 %60) #7, !dbg !418, !srcloc !419
  store i32 %61, ptr %59, align 4, !dbg !418, !tbaa !400
  %62 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %61, i32 %55, i32 1, i32 %61) #7, !dbg !420, !srcloc !421
  store i32 %62, ptr %59, align 4, !dbg !420, !tbaa !400
  %63 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %62, i32 %57, i32 2, i32 %62) #7, !dbg !422, !srcloc !423
  store i32 %63, ptr %59, align 4, !dbg !422, !tbaa !400
  %64 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %63, i32 %47, i32 3, i32 %63) #7, !dbg !424, !srcloc !425
  store i32 %64, ptr %59, align 4, !dbg !424, !tbaa !400
  %65 = getelementptr inbounds nuw i8, ptr %50, i32 8, !dbg !426
  %66 = load i32, ptr %65, align 4, !dbg !427, !tbaa !400
  %67 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %66, i32 %55, i32 0, i32 %66) #7, !dbg !427, !srcloc !428
  store i32 %67, ptr %65, align 4, !dbg !427, !tbaa !400
  %68 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %67, i32 %57, i32 1, i32 %67) #7, !dbg !429, !srcloc !430
  store i32 %68, ptr %65, align 4, !dbg !429, !tbaa !400
  %69 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %68, i32 %47, i32 2, i32 %68) #7, !dbg !431, !srcloc !432
  store i32 %69, ptr %65, align 4, !dbg !431, !tbaa !400
  %70 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %69, i32 %53, i32 3, i32 %69) #7, !dbg !433, !srcloc !434
  store i32 %70, ptr %65, align 4, !dbg !433, !tbaa !400
  %71 = getelementptr inbounds nuw i8, ptr %50, i32 12, !dbg !435
  %72 = load i32, ptr %71, align 4, !dbg !436, !tbaa !400
  %73 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %72, i32 %57, i32 0, i32 %72) #7, !dbg !436, !srcloc !437
  store i32 %73, ptr %71, align 4, !dbg !436, !tbaa !400
  %74 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %73, i32 %47, i32 1, i32 %73) #7, !dbg !438, !srcloc !439
  store i32 %74, ptr %71, align 4, !dbg !438, !tbaa !400
  %75 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %74, i32 %53, i32 2, i32 %74) #7, !dbg !440, !srcloc !441
  store i32 %75, ptr %71, align 4, !dbg !440, !tbaa !400
  %76 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %75, i32 %55, i32 3, i32 %75) #7, !dbg !442, !srcloc !443
  store i32 %76, ptr %71, align 4, !dbg !442, !tbaa !400
  %77 = load i32, ptr %50, align 4, !dbg !444, !tbaa !400
  %78 = load i32, ptr %59, align 4, !dbg !445, !tbaa !400
  store i32 %78, ptr %16, align 4, !dbg !446, !tbaa !400
  %79 = load i32, ptr %65, align 4, !dbg !447, !tbaa !400
  store i32 %79, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %76, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 3, !376, !DIExpression(), !402)
  %80 = getelementptr inbounds nuw i8, ptr %1, i32 48, !dbg !405
    #dbg_value(ptr %80, !381, !DIExpression(), !404)
  %81 = load i32, ptr %80, align 4, !dbg !406, !tbaa !400
  %82 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %81, i32 %77, i32 0, i32 %81) #7, !dbg !406, !srcloc !407
  store i32 %82, ptr %80, align 4, !dbg !406, !tbaa !400
  %83 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %84 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %82, i32 %83, i32 1, i32 %82) #7, !dbg !409, !srcloc !410
  store i32 %84, ptr %80, align 4, !dbg !409, !tbaa !400
  %85 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %86 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %84, i32 %85, i32 2, i32 %84) #7, !dbg !412, !srcloc !413
  store i32 %86, ptr %80, align 4, !dbg !412, !tbaa !400
  %87 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %88 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %86, i32 %87, i32 3, i32 %86) #7, !dbg !415, !srcloc !416
  store i32 %88, ptr %80, align 4, !dbg !415, !tbaa !400
  %89 = getelementptr inbounds nuw i8, ptr %80, i32 4, !dbg !417
  %90 = load i32, ptr %89, align 4, !dbg !418, !tbaa !400
  %91 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %90, i32 %83, i32 0, i32 %90) #7, !dbg !418, !srcloc !419
  store i32 %91, ptr %89, align 4, !dbg !418, !tbaa !400
  %92 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %91, i32 %85, i32 1, i32 %91) #7, !dbg !420, !srcloc !421
  store i32 %92, ptr %89, align 4, !dbg !420, !tbaa !400
  %93 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %92, i32 %87, i32 2, i32 %92) #7, !dbg !422, !srcloc !423
  store i32 %93, ptr %89, align 4, !dbg !422, !tbaa !400
  %94 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %93, i32 %77, i32 3, i32 %93) #7, !dbg !424, !srcloc !425
  store i32 %94, ptr %89, align 4, !dbg !424, !tbaa !400
  %95 = getelementptr inbounds nuw i8, ptr %80, i32 8, !dbg !426
  %96 = load i32, ptr %95, align 4, !dbg !427, !tbaa !400
  %97 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %96, i32 %85, i32 0, i32 %96) #7, !dbg !427, !srcloc !428
  store i32 %97, ptr %95, align 4, !dbg !427, !tbaa !400
  %98 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %97, i32 %87, i32 1, i32 %97) #7, !dbg !429, !srcloc !430
  store i32 %98, ptr %95, align 4, !dbg !429, !tbaa !400
  %99 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %98, i32 %77, i32 2, i32 %98) #7, !dbg !431, !srcloc !432
  store i32 %99, ptr %95, align 4, !dbg !431, !tbaa !400
  %100 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %99, i32 %83, i32 3, i32 %99) #7, !dbg !433, !srcloc !434
  store i32 %100, ptr %95, align 4, !dbg !433, !tbaa !400
  %101 = getelementptr inbounds nuw i8, ptr %80, i32 12, !dbg !435
  %102 = load i32, ptr %101, align 4, !dbg !436, !tbaa !400
  %103 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %102, i32 %87, i32 0, i32 %102) #7, !dbg !436, !srcloc !437
  store i32 %103, ptr %101, align 4, !dbg !436, !tbaa !400
  %104 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %103, i32 %77, i32 1, i32 %103) #7, !dbg !438, !srcloc !439
  store i32 %104, ptr %101, align 4, !dbg !438, !tbaa !400
  %105 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %104, i32 %83, i32 2, i32 %104) #7, !dbg !440, !srcloc !441
  store i32 %105, ptr %101, align 4, !dbg !440, !tbaa !400
  %106 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %105, i32 %85, i32 3, i32 %105) #7, !dbg !442, !srcloc !443
  store i32 %106, ptr %101, align 4, !dbg !442, !tbaa !400
  %107 = load i32, ptr %80, align 4, !dbg !444, !tbaa !400
  %108 = load i32, ptr %89, align 4, !dbg !445, !tbaa !400
  store i32 %108, ptr %16, align 4, !dbg !446, !tbaa !400
  %109 = load i32, ptr %95, align 4, !dbg !447, !tbaa !400
  store i32 %109, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %106, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 4, !376, !DIExpression(), !402)
  %110 = getelementptr inbounds nuw i8, ptr %1, i32 64, !dbg !405
    #dbg_value(ptr %110, !381, !DIExpression(), !404)
  %111 = load i32, ptr %110, align 4, !dbg !406, !tbaa !400
  %112 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %111, i32 %107, i32 0, i32 %111) #7, !dbg !406, !srcloc !407
  store i32 %112, ptr %110, align 4, !dbg !406, !tbaa !400
  %113 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %114 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %112, i32 %113, i32 1, i32 %112) #7, !dbg !409, !srcloc !410
  store i32 %114, ptr %110, align 4, !dbg !409, !tbaa !400
  %115 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %116 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %114, i32 %115, i32 2, i32 %114) #7, !dbg !412, !srcloc !413
  store i32 %116, ptr %110, align 4, !dbg !412, !tbaa !400
  %117 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %118 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %116, i32 %117, i32 3, i32 %116) #7, !dbg !415, !srcloc !416
  store i32 %118, ptr %110, align 4, !dbg !415, !tbaa !400
  %119 = getelementptr inbounds nuw i8, ptr %110, i32 4, !dbg !417
  %120 = load i32, ptr %119, align 4, !dbg !418, !tbaa !400
  %121 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %120, i32 %113, i32 0, i32 %120) #7, !dbg !418, !srcloc !419
  store i32 %121, ptr %119, align 4, !dbg !418, !tbaa !400
  %122 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %121, i32 %115, i32 1, i32 %121) #7, !dbg !420, !srcloc !421
  store i32 %122, ptr %119, align 4, !dbg !420, !tbaa !400
  %123 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %122, i32 %117, i32 2, i32 %122) #7, !dbg !422, !srcloc !423
  store i32 %123, ptr %119, align 4, !dbg !422, !tbaa !400
  %124 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %123, i32 %107, i32 3, i32 %123) #7, !dbg !424, !srcloc !425
  store i32 %124, ptr %119, align 4, !dbg !424, !tbaa !400
  %125 = getelementptr inbounds nuw i8, ptr %110, i32 8, !dbg !426
  %126 = load i32, ptr %125, align 4, !dbg !427, !tbaa !400
  %127 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %126, i32 %115, i32 0, i32 %126) #7, !dbg !427, !srcloc !428
  store i32 %127, ptr %125, align 4, !dbg !427, !tbaa !400
  %128 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %127, i32 %117, i32 1, i32 %127) #7, !dbg !429, !srcloc !430
  store i32 %128, ptr %125, align 4, !dbg !429, !tbaa !400
  %129 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %128, i32 %107, i32 2, i32 %128) #7, !dbg !431, !srcloc !432
  store i32 %129, ptr %125, align 4, !dbg !431, !tbaa !400
  %130 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %129, i32 %113, i32 3, i32 %129) #7, !dbg !433, !srcloc !434
  store i32 %130, ptr %125, align 4, !dbg !433, !tbaa !400
  %131 = getelementptr inbounds nuw i8, ptr %110, i32 12, !dbg !435
  %132 = load i32, ptr %131, align 4, !dbg !436, !tbaa !400
  %133 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %132, i32 %117, i32 0, i32 %132) #7, !dbg !436, !srcloc !437
  store i32 %133, ptr %131, align 4, !dbg !436, !tbaa !400
  %134 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %133, i32 %107, i32 1, i32 %133) #7, !dbg !438, !srcloc !439
  store i32 %134, ptr %131, align 4, !dbg !438, !tbaa !400
  %135 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %134, i32 %113, i32 2, i32 %134) #7, !dbg !440, !srcloc !441
  store i32 %135, ptr %131, align 4, !dbg !440, !tbaa !400
  %136 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %135, i32 %115, i32 3, i32 %135) #7, !dbg !442, !srcloc !443
  store i32 %136, ptr %131, align 4, !dbg !442, !tbaa !400
  %137 = load i32, ptr %110, align 4, !dbg !444, !tbaa !400
  %138 = load i32, ptr %119, align 4, !dbg !445, !tbaa !400
  store i32 %138, ptr %16, align 4, !dbg !446, !tbaa !400
  %139 = load i32, ptr %125, align 4, !dbg !447, !tbaa !400
  store i32 %139, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %136, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 5, !376, !DIExpression(), !402)
  %140 = getelementptr inbounds nuw i8, ptr %1, i32 80, !dbg !405
    #dbg_value(ptr %140, !381, !DIExpression(), !404)
  %141 = load i32, ptr %140, align 4, !dbg !406, !tbaa !400
  %142 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %141, i32 %137, i32 0, i32 %141) #7, !dbg !406, !srcloc !407
  store i32 %142, ptr %140, align 4, !dbg !406, !tbaa !400
  %143 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %144 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %142, i32 %143, i32 1, i32 %142) #7, !dbg !409, !srcloc !410
  store i32 %144, ptr %140, align 4, !dbg !409, !tbaa !400
  %145 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %146 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %144, i32 %145, i32 2, i32 %144) #7, !dbg !412, !srcloc !413
  store i32 %146, ptr %140, align 4, !dbg !412, !tbaa !400
  %147 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %148 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %146, i32 %147, i32 3, i32 %146) #7, !dbg !415, !srcloc !416
  store i32 %148, ptr %140, align 4, !dbg !415, !tbaa !400
  %149 = getelementptr inbounds nuw i8, ptr %140, i32 4, !dbg !417
  %150 = load i32, ptr %149, align 4, !dbg !418, !tbaa !400
  %151 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %150, i32 %143, i32 0, i32 %150) #7, !dbg !418, !srcloc !419
  store i32 %151, ptr %149, align 4, !dbg !418, !tbaa !400
  %152 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %151, i32 %145, i32 1, i32 %151) #7, !dbg !420, !srcloc !421
  store i32 %152, ptr %149, align 4, !dbg !420, !tbaa !400
  %153 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %152, i32 %147, i32 2, i32 %152) #7, !dbg !422, !srcloc !423
  store i32 %153, ptr %149, align 4, !dbg !422, !tbaa !400
  %154 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %153, i32 %137, i32 3, i32 %153) #7, !dbg !424, !srcloc !425
  store i32 %154, ptr %149, align 4, !dbg !424, !tbaa !400
  %155 = getelementptr inbounds nuw i8, ptr %140, i32 8, !dbg !426
  %156 = load i32, ptr %155, align 4, !dbg !427, !tbaa !400
  %157 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %156, i32 %145, i32 0, i32 %156) #7, !dbg !427, !srcloc !428
  store i32 %157, ptr %155, align 4, !dbg !427, !tbaa !400
  %158 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %157, i32 %147, i32 1, i32 %157) #7, !dbg !429, !srcloc !430
  store i32 %158, ptr %155, align 4, !dbg !429, !tbaa !400
  %159 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %158, i32 %137, i32 2, i32 %158) #7, !dbg !431, !srcloc !432
  store i32 %159, ptr %155, align 4, !dbg !431, !tbaa !400
  %160 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %159, i32 %143, i32 3, i32 %159) #7, !dbg !433, !srcloc !434
  store i32 %160, ptr %155, align 4, !dbg !433, !tbaa !400
  %161 = getelementptr inbounds nuw i8, ptr %140, i32 12, !dbg !435
  %162 = load i32, ptr %161, align 4, !dbg !436, !tbaa !400
  %163 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %162, i32 %147, i32 0, i32 %162) #7, !dbg !436, !srcloc !437
  store i32 %163, ptr %161, align 4, !dbg !436, !tbaa !400
  %164 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %163, i32 %137, i32 1, i32 %163) #7, !dbg !438, !srcloc !439
  store i32 %164, ptr %161, align 4, !dbg !438, !tbaa !400
  %165 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %164, i32 %143, i32 2, i32 %164) #7, !dbg !440, !srcloc !441
  store i32 %165, ptr %161, align 4, !dbg !440, !tbaa !400
  %166 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %165, i32 %145, i32 3, i32 %165) #7, !dbg !442, !srcloc !443
  store i32 %166, ptr %161, align 4, !dbg !442, !tbaa !400
  %167 = load i32, ptr %140, align 4, !dbg !444, !tbaa !400
  %168 = load i32, ptr %149, align 4, !dbg !445, !tbaa !400
  store i32 %168, ptr %16, align 4, !dbg !446, !tbaa !400
  %169 = load i32, ptr %155, align 4, !dbg !447, !tbaa !400
  store i32 %169, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %166, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 6, !376, !DIExpression(), !402)
  %170 = getelementptr inbounds nuw i8, ptr %1, i32 96, !dbg !405
    #dbg_value(ptr %170, !381, !DIExpression(), !404)
  %171 = load i32, ptr %170, align 4, !dbg !406, !tbaa !400
  %172 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %171, i32 %167, i32 0, i32 %171) #7, !dbg !406, !srcloc !407
  store i32 %172, ptr %170, align 4, !dbg !406, !tbaa !400
  %173 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %174 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %172, i32 %173, i32 1, i32 %172) #7, !dbg !409, !srcloc !410
  store i32 %174, ptr %170, align 4, !dbg !409, !tbaa !400
  %175 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %176 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %174, i32 %175, i32 2, i32 %174) #7, !dbg !412, !srcloc !413
  store i32 %176, ptr %170, align 4, !dbg !412, !tbaa !400
  %177 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %178 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %176, i32 %177, i32 3, i32 %176) #7, !dbg !415, !srcloc !416
  store i32 %178, ptr %170, align 4, !dbg !415, !tbaa !400
  %179 = getelementptr inbounds nuw i8, ptr %170, i32 4, !dbg !417
  %180 = load i32, ptr %179, align 4, !dbg !418, !tbaa !400
  %181 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %180, i32 %173, i32 0, i32 %180) #7, !dbg !418, !srcloc !419
  store i32 %181, ptr %179, align 4, !dbg !418, !tbaa !400
  %182 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %181, i32 %175, i32 1, i32 %181) #7, !dbg !420, !srcloc !421
  store i32 %182, ptr %179, align 4, !dbg !420, !tbaa !400
  %183 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %182, i32 %177, i32 2, i32 %182) #7, !dbg !422, !srcloc !423
  store i32 %183, ptr %179, align 4, !dbg !422, !tbaa !400
  %184 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %183, i32 %167, i32 3, i32 %183) #7, !dbg !424, !srcloc !425
  store i32 %184, ptr %179, align 4, !dbg !424, !tbaa !400
  %185 = getelementptr inbounds nuw i8, ptr %170, i32 8, !dbg !426
  %186 = load i32, ptr %185, align 4, !dbg !427, !tbaa !400
  %187 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %186, i32 %175, i32 0, i32 %186) #7, !dbg !427, !srcloc !428
  store i32 %187, ptr %185, align 4, !dbg !427, !tbaa !400
  %188 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %187, i32 %177, i32 1, i32 %187) #7, !dbg !429, !srcloc !430
  store i32 %188, ptr %185, align 4, !dbg !429, !tbaa !400
  %189 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %188, i32 %167, i32 2, i32 %188) #7, !dbg !431, !srcloc !432
  store i32 %189, ptr %185, align 4, !dbg !431, !tbaa !400
  %190 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %189, i32 %173, i32 3, i32 %189) #7, !dbg !433, !srcloc !434
  store i32 %190, ptr %185, align 4, !dbg !433, !tbaa !400
  %191 = getelementptr inbounds nuw i8, ptr %170, i32 12, !dbg !435
  %192 = load i32, ptr %191, align 4, !dbg !436, !tbaa !400
  %193 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %192, i32 %177, i32 0, i32 %192) #7, !dbg !436, !srcloc !437
  store i32 %193, ptr %191, align 4, !dbg !436, !tbaa !400
  %194 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %193, i32 %167, i32 1, i32 %193) #7, !dbg !438, !srcloc !439
  store i32 %194, ptr %191, align 4, !dbg !438, !tbaa !400
  %195 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %194, i32 %173, i32 2, i32 %194) #7, !dbg !440, !srcloc !441
  store i32 %195, ptr %191, align 4, !dbg !440, !tbaa !400
  %196 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %195, i32 %175, i32 3, i32 %195) #7, !dbg !442, !srcloc !443
  store i32 %196, ptr %191, align 4, !dbg !442, !tbaa !400
  %197 = load i32, ptr %170, align 4, !dbg !444, !tbaa !400
  %198 = load i32, ptr %179, align 4, !dbg !445, !tbaa !400
  store i32 %198, ptr %16, align 4, !dbg !446, !tbaa !400
  %199 = load i32, ptr %185, align 4, !dbg !447, !tbaa !400
  store i32 %199, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %196, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 7, !376, !DIExpression(), !402)
  %200 = getelementptr inbounds nuw i8, ptr %1, i32 112, !dbg !405
    #dbg_value(ptr %200, !381, !DIExpression(), !404)
  %201 = load i32, ptr %200, align 4, !dbg !406, !tbaa !400
  %202 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %201, i32 %197, i32 0, i32 %201) #7, !dbg !406, !srcloc !407
  store i32 %202, ptr %200, align 4, !dbg !406, !tbaa !400
  %203 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %204 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %202, i32 %203, i32 1, i32 %202) #7, !dbg !409, !srcloc !410
  store i32 %204, ptr %200, align 4, !dbg !409, !tbaa !400
  %205 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %206 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %204, i32 %205, i32 2, i32 %204) #7, !dbg !412, !srcloc !413
  store i32 %206, ptr %200, align 4, !dbg !412, !tbaa !400
  %207 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %208 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %206, i32 %207, i32 3, i32 %206) #7, !dbg !415, !srcloc !416
  store i32 %208, ptr %200, align 4, !dbg !415, !tbaa !400
  %209 = getelementptr inbounds nuw i8, ptr %200, i32 4, !dbg !417
  %210 = load i32, ptr %209, align 4, !dbg !418, !tbaa !400
  %211 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %210, i32 %203, i32 0, i32 %210) #7, !dbg !418, !srcloc !419
  store i32 %211, ptr %209, align 4, !dbg !418, !tbaa !400
  %212 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %211, i32 %205, i32 1, i32 %211) #7, !dbg !420, !srcloc !421
  store i32 %212, ptr %209, align 4, !dbg !420, !tbaa !400
  %213 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %212, i32 %207, i32 2, i32 %212) #7, !dbg !422, !srcloc !423
  store i32 %213, ptr %209, align 4, !dbg !422, !tbaa !400
  %214 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %213, i32 %197, i32 3, i32 %213) #7, !dbg !424, !srcloc !425
  store i32 %214, ptr %209, align 4, !dbg !424, !tbaa !400
  %215 = getelementptr inbounds nuw i8, ptr %200, i32 8, !dbg !426
  %216 = load i32, ptr %215, align 4, !dbg !427, !tbaa !400
  %217 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %216, i32 %205, i32 0, i32 %216) #7, !dbg !427, !srcloc !428
  store i32 %217, ptr %215, align 4, !dbg !427, !tbaa !400
  %218 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %217, i32 %207, i32 1, i32 %217) #7, !dbg !429, !srcloc !430
  store i32 %218, ptr %215, align 4, !dbg !429, !tbaa !400
  %219 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %218, i32 %197, i32 2, i32 %218) #7, !dbg !431, !srcloc !432
  store i32 %219, ptr %215, align 4, !dbg !431, !tbaa !400
  %220 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %219, i32 %203, i32 3, i32 %219) #7, !dbg !433, !srcloc !434
  store i32 %220, ptr %215, align 4, !dbg !433, !tbaa !400
  %221 = getelementptr inbounds nuw i8, ptr %200, i32 12, !dbg !435
  %222 = load i32, ptr %221, align 4, !dbg !436, !tbaa !400
  %223 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %222, i32 %207, i32 0, i32 %222) #7, !dbg !436, !srcloc !437
  store i32 %223, ptr %221, align 4, !dbg !436, !tbaa !400
  %224 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %223, i32 %197, i32 1, i32 %223) #7, !dbg !438, !srcloc !439
  store i32 %224, ptr %221, align 4, !dbg !438, !tbaa !400
  %225 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %224, i32 %203, i32 2, i32 %224) #7, !dbg !440, !srcloc !441
  store i32 %225, ptr %221, align 4, !dbg !440, !tbaa !400
  %226 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %225, i32 %205, i32 3, i32 %225) #7, !dbg !442, !srcloc !443
  store i32 %226, ptr %221, align 4, !dbg !442, !tbaa !400
  %227 = load i32, ptr %200, align 4, !dbg !444, !tbaa !400
  %228 = load i32, ptr %209, align 4, !dbg !445, !tbaa !400
  store i32 %228, ptr %16, align 4, !dbg !446, !tbaa !400
  %229 = load i32, ptr %215, align 4, !dbg !447, !tbaa !400
  store i32 %229, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %226, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 8, !376, !DIExpression(), !402)
  %230 = getelementptr inbounds nuw i8, ptr %1, i32 128, !dbg !405
    #dbg_value(ptr %230, !381, !DIExpression(), !404)
  %231 = load i32, ptr %230, align 4, !dbg !406, !tbaa !400
  %232 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %231, i32 %227, i32 0, i32 %231) #7, !dbg !406, !srcloc !407
  store i32 %232, ptr %230, align 4, !dbg !406, !tbaa !400
  %233 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %234 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %232, i32 %233, i32 1, i32 %232) #7, !dbg !409, !srcloc !410
  store i32 %234, ptr %230, align 4, !dbg !409, !tbaa !400
  %235 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %236 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %234, i32 %235, i32 2, i32 %234) #7, !dbg !412, !srcloc !413
  store i32 %236, ptr %230, align 4, !dbg !412, !tbaa !400
  %237 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %238 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %236, i32 %237, i32 3, i32 %236) #7, !dbg !415, !srcloc !416
  store i32 %238, ptr %230, align 4, !dbg !415, !tbaa !400
  %239 = getelementptr inbounds nuw i8, ptr %230, i32 4, !dbg !417
  %240 = load i32, ptr %239, align 4, !dbg !418, !tbaa !400
  %241 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %240, i32 %233, i32 0, i32 %240) #7, !dbg !418, !srcloc !419
  store i32 %241, ptr %239, align 4, !dbg !418, !tbaa !400
  %242 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %241, i32 %235, i32 1, i32 %241) #7, !dbg !420, !srcloc !421
  store i32 %242, ptr %239, align 4, !dbg !420, !tbaa !400
  %243 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %242, i32 %237, i32 2, i32 %242) #7, !dbg !422, !srcloc !423
  store i32 %243, ptr %239, align 4, !dbg !422, !tbaa !400
  %244 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %243, i32 %227, i32 3, i32 %243) #7, !dbg !424, !srcloc !425
  store i32 %244, ptr %239, align 4, !dbg !424, !tbaa !400
  %245 = getelementptr inbounds nuw i8, ptr %230, i32 8, !dbg !426
  %246 = load i32, ptr %245, align 4, !dbg !427, !tbaa !400
  %247 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %246, i32 %235, i32 0, i32 %246) #7, !dbg !427, !srcloc !428
  store i32 %247, ptr %245, align 4, !dbg !427, !tbaa !400
  %248 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %247, i32 %237, i32 1, i32 %247) #7, !dbg !429, !srcloc !430
  store i32 %248, ptr %245, align 4, !dbg !429, !tbaa !400
  %249 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %248, i32 %227, i32 2, i32 %248) #7, !dbg !431, !srcloc !432
  store i32 %249, ptr %245, align 4, !dbg !431, !tbaa !400
  %250 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %249, i32 %233, i32 3, i32 %249) #7, !dbg !433, !srcloc !434
  store i32 %250, ptr %245, align 4, !dbg !433, !tbaa !400
  %251 = getelementptr inbounds nuw i8, ptr %230, i32 12, !dbg !435
  %252 = load i32, ptr %251, align 4, !dbg !436, !tbaa !400
  %253 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %252, i32 %237, i32 0, i32 %252) #7, !dbg !436, !srcloc !437
  store i32 %253, ptr %251, align 4, !dbg !436, !tbaa !400
  %254 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %253, i32 %227, i32 1, i32 %253) #7, !dbg !438, !srcloc !439
  store i32 %254, ptr %251, align 4, !dbg !438, !tbaa !400
  %255 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %254, i32 %233, i32 2, i32 %254) #7, !dbg !440, !srcloc !441
  store i32 %255, ptr %251, align 4, !dbg !440, !tbaa !400
  %256 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %255, i32 %235, i32 3, i32 %255) #7, !dbg !442, !srcloc !443
  store i32 %256, ptr %251, align 4, !dbg !442, !tbaa !400
  %257 = load i32, ptr %230, align 4, !dbg !444, !tbaa !400
  %258 = load i32, ptr %239, align 4, !dbg !445, !tbaa !400
  store i32 %258, ptr %16, align 4, !dbg !446, !tbaa !400
  %259 = load i32, ptr %245, align 4, !dbg !447, !tbaa !400
  store i32 %259, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %256, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 9, !376, !DIExpression(), !402)
  %260 = getelementptr inbounds nuw i8, ptr %1, i32 144, !dbg !405
    #dbg_value(ptr %260, !381, !DIExpression(), !404)
  %261 = load i32, ptr %260, align 4, !dbg !406, !tbaa !400
  %262 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %261, i32 %257, i32 0, i32 %261) #7, !dbg !406, !srcloc !407
  store i32 %262, ptr %260, align 4, !dbg !406, !tbaa !400
  %263 = load i32, ptr %16, align 4, !dbg !408, !tbaa !400
  %264 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %262, i32 %263, i32 1, i32 %262) #7, !dbg !409, !srcloc !410
  store i32 %264, ptr %260, align 4, !dbg !409, !tbaa !400
  %265 = load i32, ptr %17, align 4, !dbg !411, !tbaa !400
  %266 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %264, i32 %265, i32 2, i32 %264) #7, !dbg !412, !srcloc !413
  store i32 %266, ptr %260, align 4, !dbg !412, !tbaa !400
  %267 = load i32, ptr %18, align 4, !dbg !414, !tbaa !400
  %268 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %266, i32 %267, i32 3, i32 %266) #7, !dbg !415, !srcloc !416
  store i32 %268, ptr %260, align 4, !dbg !415, !tbaa !400
  %269 = getelementptr inbounds nuw i8, ptr %260, i32 4, !dbg !417
  %270 = load i32, ptr %269, align 4, !dbg !418, !tbaa !400
  %271 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %270, i32 %263, i32 0, i32 %270) #7, !dbg !418, !srcloc !419
  store i32 %271, ptr %269, align 4, !dbg !418, !tbaa !400
  %272 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %271, i32 %265, i32 1, i32 %271) #7, !dbg !420, !srcloc !421
  store i32 %272, ptr %269, align 4, !dbg !420, !tbaa !400
  %273 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %272, i32 %267, i32 2, i32 %272) #7, !dbg !422, !srcloc !423
  store i32 %273, ptr %269, align 4, !dbg !422, !tbaa !400
  %274 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %273, i32 %257, i32 3, i32 %273) #7, !dbg !424, !srcloc !425
  store i32 %274, ptr %269, align 4, !dbg !424, !tbaa !400
  %275 = getelementptr inbounds nuw i8, ptr %260, i32 8, !dbg !426
  %276 = load i32, ptr %275, align 4, !dbg !427, !tbaa !400
  %277 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %276, i32 %265, i32 0, i32 %276) #7, !dbg !427, !srcloc !428
  store i32 %277, ptr %275, align 4, !dbg !427, !tbaa !400
  %278 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %277, i32 %267, i32 1, i32 %277) #7, !dbg !429, !srcloc !430
  store i32 %278, ptr %275, align 4, !dbg !429, !tbaa !400
  %279 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %278, i32 %257, i32 2, i32 %278) #7, !dbg !431, !srcloc !432
  store i32 %279, ptr %275, align 4, !dbg !431, !tbaa !400
  %280 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %279, i32 %263, i32 3, i32 %279) #7, !dbg !433, !srcloc !434
  store i32 %280, ptr %275, align 4, !dbg !433, !tbaa !400
  %281 = getelementptr inbounds nuw i8, ptr %260, i32 12, !dbg !435
  %282 = load i32, ptr %281, align 4, !dbg !436, !tbaa !400
  %283 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %282, i32 %267, i32 0, i32 %282) #7, !dbg !436, !srcloc !437
  store i32 %283, ptr %281, align 4, !dbg !436, !tbaa !400
  %284 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %283, i32 %257, i32 1, i32 %283) #7, !dbg !438, !srcloc !439
  store i32 %284, ptr %281, align 4, !dbg !438, !tbaa !400
  %285 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %284, i32 %263, i32 2, i32 %284) #7, !dbg !440, !srcloc !441
  store i32 %285, ptr %281, align 4, !dbg !440, !tbaa !400
  %286 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %285, i32 %265, i32 3, i32 %285) #7, !dbg !442, !srcloc !443
  store i32 %286, ptr %281, align 4, !dbg !442, !tbaa !400
  %287 = load i32, ptr %260, align 4, !dbg !444, !tbaa !400
  %288 = load i32, ptr %269, align 4, !dbg !445, !tbaa !400
  store i32 %288, ptr %16, align 4, !dbg !446, !tbaa !400
  %289 = load i32, ptr %275, align 4, !dbg !447, !tbaa !400
  store i32 %289, ptr %17, align 4, !dbg !448, !tbaa !400
  store i32 %286, ptr %18, align 4, !dbg !449, !tbaa !400
    #dbg_value(i32 10, !376, !DIExpression(), !402)
    #dbg_value(ptr %4, !382, !DIExpression(), !385)
  %290 = getelementptr inbounds nuw i8, ptr %1, i32 160, !dbg !450
    #dbg_value(ptr %290, !383, !DIExpression(), !385)
  %291 = load i32, ptr %290, align 4, !dbg !451, !tbaa !400
  %292 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %291, i32 %287, i32 0, i32 %291) #7, !dbg !451, !srcloc !452
  store i32 %292, ptr %290, align 4, !dbg !451, !tbaa !400
  %293 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %292, i32 %288, i32 1, i32 %292) #7, !dbg !453, !srcloc !454
  store i32 %293, ptr %290, align 4, !dbg !453, !tbaa !400
  %294 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %293, i32 %289, i32 2, i32 %293) #7, !dbg !455, !srcloc !456
  store i32 %294, ptr %290, align 4, !dbg !455, !tbaa !400
  %295 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %294, i32 %286, i32 3, i32 %294) #7, !dbg !457, !srcloc !458
  store i32 %295, ptr %290, align 4, !dbg !457, !tbaa !400
  %296 = getelementptr inbounds nuw i8, ptr %1, i32 164, !dbg !459
  %297 = load i32, ptr %296, align 4, !dbg !460, !tbaa !400
  %298 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %297, i32 %288, i32 0, i32 %297) #7, !dbg !460, !srcloc !461
  store i32 %298, ptr %296, align 4, !dbg !460, !tbaa !400
  %299 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %298, i32 %289, i32 1, i32 %298) #7, !dbg !462, !srcloc !463
  store i32 %299, ptr %296, align 4, !dbg !462, !tbaa !400
  %300 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %299, i32 %286, i32 2, i32 %299) #7, !dbg !464, !srcloc !465
  store i32 %300, ptr %296, align 4, !dbg !464, !tbaa !400
  %301 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %300, i32 %287, i32 3, i32 %300) #7, !dbg !466, !srcloc !467
  store i32 %301, ptr %296, align 4, !dbg !466, !tbaa !400
  %302 = getelementptr inbounds nuw i8, ptr %1, i32 168, !dbg !468
  %303 = load i32, ptr %302, align 4, !dbg !469, !tbaa !400
  %304 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %303, i32 %289, i32 0, i32 %303) #7, !dbg !469, !srcloc !470
  store i32 %304, ptr %302, align 4, !dbg !469, !tbaa !400
  %305 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %304, i32 %286, i32 1, i32 %304) #7, !dbg !471, !srcloc !472
  store i32 %305, ptr %302, align 4, !dbg !471, !tbaa !400
  %306 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %305, i32 %287, i32 2, i32 %305) #7, !dbg !473, !srcloc !474
  store i32 %306, ptr %302, align 4, !dbg !473, !tbaa !400
  %307 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %306, i32 %288, i32 3, i32 %306) #7, !dbg !475, !srcloc !476
  store i32 %307, ptr %302, align 4, !dbg !475, !tbaa !400
  %308 = getelementptr inbounds nuw i8, ptr %1, i32 172, !dbg !477
  %309 = load i32, ptr %308, align 4, !dbg !478, !tbaa !400
  %310 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %309, i32 %286, i32 0, i32 %309) #7, !dbg !478, !srcloc !479
  store i32 %310, ptr %308, align 4, !dbg !478, !tbaa !400
  %311 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %310, i32 %287, i32 1, i32 %310) #7, !dbg !480, !srcloc !481
  store i32 %311, ptr %308, align 4, !dbg !480, !tbaa !400
  %312 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %311, i32 %288, i32 2, i32 %311) #7, !dbg !482, !srcloc !483
  store i32 %312, ptr %308, align 4, !dbg !482, !tbaa !400
  %313 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %312, i32 %289, i32 3, i32 %312) #7, !dbg !484, !srcloc !485
  store i32 %313, ptr %308, align 4, !dbg !484, !tbaa !400
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %2, ptr noundef nonnull align 4 dereferenceable(16) %290, i32 16, i1 false), !dbg !486
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #7, !dbg !487
  ret void, !dbg !487
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #5

; Function Attrs: nounwind optsize
define dso_local void @aes128_ecb_encrypt(ptr nocapture noundef readonly %0, i32 noundef %1, ptr nocapture noundef readonly %2, ptr nocapture noundef writeonly %3) local_unnamed_addr #4 !dbg !488 {
  %5 = alloca [176 x i8], align 1, !DIAssignID !511
    #dbg_assign(i1 undef, !500, !DIExpression(), !511, ptr %5, !DIExpression(), !512)
  %6 = alloca [176 x i8], align 1, !DIAssignID !513
    #dbg_assign(i1 undef, !504, !DIExpression(), !513, ptr %6, !DIExpression(), !512)
    #dbg_value(ptr %0, !496, !DIExpression(), !512)
    #dbg_value(i32 %1, !497, !DIExpression(), !512)
    #dbg_value(ptr %2, !498, !DIExpression(), !512)
    #dbg_value(ptr %3, !499, !DIExpression(), !512)
  %7 = and i32 %1, 15, !dbg !514
  %8 = icmp eq i32 %7, 0, !dbg !516
  br i1 %8, label %9, label %18, !dbg !516

9:                                                ; preds = %4
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %5) #7, !dbg !517
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %6) #7, !dbg !518
  call void @expand_key(ptr noundef %2, ptr noundef nonnull %5) #8, !dbg !519
    #dbg_value(i32 0, !505, !DIExpression(), !520)
  %10 = icmp eq i32 %1, 0, !dbg !521
  br i1 %10, label %17, label %.preheader, !dbg !522

.preheader:                                       ; preds = %9
  br label %11, !dbg !522

11:                                               ; preds = %.preheader, %11
  %12 = phi i32 [ %15, %11 ], [ 0, %.preheader ]
    #dbg_value(i32 %12, !505, !DIExpression(), !520)
    #dbg_value(i32 0, !507, !DIExpression(), !523)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(176) %6, ptr noundef nonnull align 1 dereferenceable(176) %5, i32 176, i1 false), !dbg !524, !tbaa !60
    #dbg_value(i32 poison, !507, !DIExpression(), !523)
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 %12, !dbg !527
  %14 = getelementptr inbounds nuw i8, ptr %3, i32 %12, !dbg !528
  call void @aes128_encrypt_block(ptr noundef %13, ptr noundef nonnull %6, ptr noundef %14) #8, !dbg !529
  %15 = add i32 %12, 16, !dbg !530
    #dbg_value(i32 %15, !505, !DIExpression(), !520)
  %16 = icmp ult i32 %15, %1, !dbg !521
  br i1 %16, label %11, label %.loopexit, !dbg !522, !llvm.loop !531

.loopexit:                                        ; preds = %11
  br label %17, !dbg !533

17:                                               ; preds = %.loopexit, %9
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %6) #7, !dbg !533
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %5) #7, !dbg !533
  br label %18, !dbg !533

18:                                               ; preds = %17, %4
  ret void, !dbg !533
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_to_address(i32 noundef %0, i32 noundef %1) local_unnamed_addr #6 !dbg !534 {
    #dbg_value(i32 %0, !540, !DIExpression(), !542)
    #dbg_value(i32 %1, !541, !DIExpression(), !542)
  %3 = inttoptr i32 %0 to ptr, !dbg !543
  store volatile i32 %1, ptr %3, align 4, !dbg !544, !tbaa !400
  ret void, !dbg !545
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_v_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #6 !dbg !546 {
    #dbg_value(i32 %0, !550, !DIExpression(), !555)
    #dbg_value(ptr %1, !551, !DIExpression(), !555)
    #dbg_value(ptr %1, !552, !DIExpression(), !555)
    #dbg_value(i32 0, !553, !DIExpression(), !556)
  br label %4, !dbg !557

3:                                                ; preds = %4
  ret void, !dbg !558

4:                                                ; preds = %4, %2
  %5 = phi i32 [ 0, %2 ], [ %11, %4 ]
    #dbg_value(i32 %5, !553, !DIExpression(), !556)
  %6 = shl nuw nsw i32 %5, 2, !dbg !559
  %7 = add i32 %6, %0, !dbg !562
  %8 = getelementptr inbounds nuw i32, ptr %1, i32 %5, !dbg !563
  %9 = load i32, ptr %8, align 4, !dbg !563, !tbaa !400
    #dbg_value(i32 %7, !540, !DIExpression(), !564)
    #dbg_value(i32 %9, !541, !DIExpression(), !564)
  %10 = inttoptr i32 %7 to ptr, !dbg !566
  store volatile i32 %9, ptr %10, align 4, !dbg !567, !tbaa !400
  %11 = add nuw nsw i32 %5, 1, !dbg !568
    #dbg_value(i32 %11, !553, !DIExpression(), !556)
  %12 = icmp eq i32 %11, 4, !dbg !569
  br i1 %12, label %3, label %4, !dbg !557, !llvm.loop !570
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_numb_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #6 !dbg !572 {
    #dbg_value(i32 %0, !574, !DIExpression(), !577)
    #dbg_value(ptr %1, !575, !DIExpression(), !577)
    #dbg_value(ptr %1, !576, !DIExpression(), !577)
  %3 = load i32, ptr %1, align 4, !dbg !578, !tbaa !400
    #dbg_value(i32 %0, !540, !DIExpression(), !579)
    #dbg_value(i32 %3, !541, !DIExpression(), !579)
  %4 = inttoptr i32 %0 to ptr, !dbg !581
  store volatile i32 %3, ptr %4, align 4, !dbg !582, !tbaa !400
  ret void, !dbg !583
}

; Function Attrs: nounwind optsize
define dso_local noundef i32 @main() local_unnamed_addr #4 !dbg !584 {
    #dbg_assign(i1 undef, !588, !DIExpression(), !597, ptr @__const.main.plaintext, !DIExpression(), !598)
    #dbg_assign(i1 undef, !589, !DIExpression(), !599, ptr @__const.main.key, !DIExpression(), !598)
    #dbg_assign(i1 undef, !590, !DIExpression(), !600, ptr @__const.main.expected_output, !DIExpression(), !598)
  %1 = alloca [16 x i8], align 1, !DIAssignID !601
    #dbg_assign(i1 undef, !591, !DIExpression(), !601, ptr %1, !DIExpression(), !598)
    #dbg_assign(i1 undef, !588, !DIExpression(), !602, ptr @__const.main.plaintext, !DIExpression(), !598)
    #dbg_assign(i1 undef, !589, !DIExpression(), !603, ptr @__const.main.key, !DIExpression(), !598)
    #dbg_assign(i1 undef, !590, !DIExpression(), !604, ptr @__const.main.expected_output, !DIExpression(), !598)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #7, !dbg !605
    #dbg_value(i32 16, !592, !DIExpression(), !598)
  call void @aes128_ecb_encrypt(ptr noundef nonnull @__const.main.plaintext, i32 noundef 16, ptr noundef nonnull @__const.main.key, ptr noundef nonnull %1) #8, !dbg !606
    #dbg_value(i32 1056816, !593, !DIExpression(), !598)
    #dbg_value(i32 1056816, !550, !DIExpression(), !607)
    #dbg_value(ptr @__const.main.expected_output, !551, !DIExpression(), !607)
    #dbg_value(ptr @__const.main.expected_output, !552, !DIExpression(), !607)
    #dbg_value(i32 0, !553, !DIExpression(), !609)
    #dbg_value(i32 0, !553, !DIExpression(), !609)
    #dbg_value(i32 1056816, !540, !DIExpression(), !610)
    #dbg_value(i32 -73070316, !541, !DIExpression(), !610)
  store volatile i32 -73070316, ptr inttoptr (i32 1056816 to ptr), align 16, !dbg !612, !tbaa !400
    #dbg_value(i32 1, !553, !DIExpression(), !609)
    #dbg_value(i32 1056820, !540, !DIExpression(), !610)
    #dbg_value(i32 1900803103, !541, !DIExpression(), !610)
  store volatile i32 1900803103, ptr inttoptr (i32 1056820 to ptr), align 4, !dbg !612, !tbaa !400
    #dbg_value(i32 2, !553, !DIExpression(), !609)
    #dbg_value(i32 1056824, !540, !DIExpression(), !610)
    #dbg_value(i32 774220478, !541, !DIExpression(), !610)
  store volatile i32 774220478, ptr inttoptr (i32 1056824 to ptr), align 8, !dbg !612, !tbaa !400
    #dbg_value(i32 3, !553, !DIExpression(), !609)
    #dbg_value(i32 1056828, !540, !DIExpression(), !610)
    #dbg_value(i32 -1426520049, !541, !DIExpression(), !610)
  store volatile i32 -1426520049, ptr inttoptr (i32 1056828 to ptr), align 4, !dbg !612, !tbaa !400
    #dbg_value(i32 4, !553, !DIExpression(), !609)
    #dbg_value(i32 0, !553, !DIExpression(), !613)
  %2 = load i32, ptr %1, align 4, !dbg !615, !tbaa !400
    #dbg_value(i32 1056832, !540, !DIExpression(), !616)
    #dbg_value(i32 %2, !541, !DIExpression(), !616)
  store volatile i32 %2, ptr inttoptr (i32 1056832 to ptr), align 64, !dbg !618, !tbaa !400
    #dbg_value(i32 1, !553, !DIExpression(), !613)
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 4, !dbg !615
  %4 = load i32, ptr %3, align 4, !dbg !615, !tbaa !400
    #dbg_value(i32 1056836, !540, !DIExpression(), !616)
    #dbg_value(i32 %4, !541, !DIExpression(), !616)
  store volatile i32 %4, ptr inttoptr (i32 1056836 to ptr), align 4, !dbg !618, !tbaa !400
    #dbg_value(i32 2, !553, !DIExpression(), !613)
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 8, !dbg !615
  %6 = load i32, ptr %5, align 4, !dbg !615, !tbaa !400
    #dbg_value(i32 1056840, !540, !DIExpression(), !616)
    #dbg_value(i32 %6, !541, !DIExpression(), !616)
  store volatile i32 %6, ptr inttoptr (i32 1056840 to ptr), align 8, !dbg !618, !tbaa !400
    #dbg_value(i32 3, !553, !DIExpression(), !613)
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 12, !dbg !615
  %8 = load i32, ptr %7, align 4, !dbg !615, !tbaa !400
    #dbg_value(i32 1056844, !540, !DIExpression(), !616)
    #dbg_value(i32 %8, !541, !DIExpression(), !616)
  store volatile i32 %8, ptr inttoptr (i32 1056844 to ptr), align 4, !dbg !618, !tbaa !400
    #dbg_value(i32 4, !553, !DIExpression(), !613)
  br label %12, !dbg !619

9:                                                ; preds = %12
  %10 = add nuw nsw i32 %13, 1, !dbg !620
    #dbg_value(i32 %10, !595, !DIExpression(), !622)
    #dbg_value(i32 %10, !595, !DIExpression(), !622)
  %11 = icmp eq i32 %10, 16, !dbg !623
  br i1 %11, label %19, label %12, !dbg !619, !llvm.loop !624

12:                                               ; preds = %9, %0
  %13 = phi i32 [ %10, %9 ], [ 0, %0 ]
    #dbg_value(i32 %13, !595, !DIExpression(), !622)
  %14 = getelementptr inbounds nuw [16 x i8], ptr %1, i32 0, i32 %13, !dbg !626
  %15 = load i8, ptr %14, align 1, !dbg !626, !tbaa !60
  %16 = getelementptr inbounds nuw [16 x i8], ptr @__const.main.expected_output, i32 0, i32 %13, !dbg !629
  %17 = load i8, ptr %16, align 1, !dbg !629, !tbaa !60
  %18 = icmp eq i8 %15, %17, !dbg !630
    #dbg_value(i32 %13, !595, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !622)
  br i1 %18, label %9, label %19, !dbg !630

19:                                               ; preds = %12, %9
  %20 = phi i32 [ -889275714, %9 ], [ -1163220307, %12 ], !dbg !598
    #dbg_value(i32 %20, !594, !DIExpression(), !598)
    #dbg_value(i32 1056772, !540, !DIExpression(), !631)
    #dbg_value(i32 %20, !541, !DIExpression(), !631)
  store volatile i32 %20, ptr inttoptr (i32 1056772 to ptr), align 4, !dbg !633, !tbaa !400
    #dbg_value(i32 1056768, !593, !DIExpression(), !598)
    #dbg_value(i32 -559038737, !594, !DIExpression(), !598)
    #dbg_value(i32 1056768, !540, !DIExpression(), !634)
    #dbg_value(i32 -559038737, !541, !DIExpression(), !634)
  store volatile i32 -559038737, ptr inttoptr (i32 1056768 to ptr), align 8192, !dbg !636, !tbaa !400
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #7, !dbg !637
  ret i32 0, !dbg !637
}

attributes #0 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nofree norecurse nosync nounwind optsize memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nofree norecurse nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { nounwind }
attributes #8 = { optsize }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "sbox", scope: !2, file: !3, line: 6, type: !23, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.8 (++20250804090239+87f0227cb601-1~exp1~20250804210352.139)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "main.c", directory: "/home/borislav/Documents/pdp-project-29/software", checksumkind: CSK_MD5, checksum: "3820b61764eb3f14550d3e4c31d13d2f")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 32)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !7, line: 48, baseType: !8)
!7 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/sys/_stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "ab914e287601b2385e57880e6599aa6b")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 79, baseType: !10)
!9 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/machine/_default_types.h", directory: "", checksumkind: CSK_MD5, checksum: "f7024d0682a918b41f94e8be9cd90461")
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "rcon", scope: !2, file: !3, line: 31, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!17 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !7, line: 24, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 2048, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 256)
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 1, !"target-abi", !"ilp32"}
!30 = !{i32 6, !"riscv-isa", !31}
!31 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zkne1p0"}
!32 = !{i32 8, !"SmallDataLimit", i32 8}
!33 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!34 = !{!"Ubuntu clang version 20.1.8 (++20250804090239+87f0227cb601-1~exp1~20250804210352.139)"}
!35 = distinct !DISubprogram(name: "expand_key", scope: !3, file: !3, line: 35, type: !36, scopeLine: 35, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !39)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 32)
!39 = !{!40, !41, !42, !44, !51}
!40 = !DILocalVariable(name: "key", arg: 1, scope: !35, file: !3, line: 35, type: !38)
!41 = !DILocalVariable(name: "round_keys", arg: 2, scope: !35, file: !3, line: 35, type: !38)
!42 = !DILocalVariable(name: "i", scope: !35, file: !3, line: 36, type: !43)
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DILocalVariable(name: "temp", scope: !45, file: !3, line: 41, type: !48)
!45 = distinct !DILexicalBlock(scope: !46, file: !3, line: 40, column: 33)
!46 = distinct !DILexicalBlock(scope: !47, file: !3, line: 40, column: 3)
!47 = distinct !DILexicalBlock(scope: !35, file: !3, line: 40, column: 3)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 4)
!51 = !DILocalVariable(name: "t", scope: !52, file: !3, line: 47, type: !18)
!52 = distinct !DILexicalBlock(scope: !53, file: !3, line: 46, column: 22)
!53 = distinct !DILexicalBlock(scope: !45, file: !3, line: 46, column: 9)
!54 = !DILocation(line: 0, scope: !35)
!55 = !DILocation(line: 37, column: 3, scope: !56)
!56 = distinct !DILexicalBlock(scope: !35, file: !3, line: 37, column: 3)
!57 = !DILocation(line: 38, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !3, line: 37, column: 28)
!59 = distinct !DILexicalBlock(scope: !56, file: !3, line: 37, column: 3)
!60 = !{!61, !61, i64 0}
!61 = !{!"omnipotent char", !62, i64 0}
!62 = !{!"Simple C/C++ TBAA"}
!63 = !DILocation(line: 38, column: 5, scope: !58)
!64 = !DILocation(line: 38, column: 19, scope: !58)
!65 = !DILocation(line: 37, column: 24, scope: !59)
!66 = !DILocation(line: 37, column: 17, scope: !59)
!67 = distinct !{!67, !55, !68, !69}
!68 = !DILocation(line: 39, column: 3, scope: !56)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 40, column: 3, scope: !47)
!71 = !DILocation(line: 42, column: 15, scope: !45)
!72 = !DILocation(line: 0, scope: !45)
!73 = !DILocation(line: 43, column: 15, scope: !45)
!74 = !DILocation(line: 44, column: 15, scope: !45)
!75 = !DILocation(line: 45, column: 15, scope: !45)
!76 = !DILocation(line: 46, column: 11, scope: !53)
!77 = !DILocation(line: 46, column: 16, scope: !53)
!78 = !DILocation(line: 0, scope: !52)
!79 = !DILocation(line: 48, column: 17, scope: !52)
!80 = !DILocation(line: 49, column: 17, scope: !52)
!81 = !DILocation(line: 50, column: 17, scope: !52)
!82 = !DILocation(line: 51, column: 17, scope: !52)
!83 = !DILocation(line: 52, column: 26, scope: !52)
!84 = !DILocation(line: 52, column: 32, scope: !52)
!85 = !DILocation(line: 52, column: 18, scope: !52)
!86 = !DILocation(line: 52, column: 15, scope: !52)
!87 = !DILocation(line: 53, column: 5, scope: !52)
!88 = !DILocation(line: 54, column: 21, scope: !45)
!89 = !DILocation(line: 54, column: 40, scope: !45)
!90 = !DILocation(line: 54, column: 19, scope: !45)
!91 = !DILocation(line: 55, column: 25, scope: !45)
!92 = !DILocation(line: 55, column: 44, scope: !45)
!93 = !DILocation(line: 55, column: 18, scope: !45)
!94 = !DILocation(line: 55, column: 5, scope: !45)
!95 = !DILocation(line: 55, column: 23, scope: !45)
!96 = !DILocation(line: 56, column: 25, scope: !45)
!97 = !DILocation(line: 56, column: 44, scope: !45)
!98 = !DILocation(line: 56, column: 18, scope: !45)
!99 = !DILocation(line: 56, column: 5, scope: !45)
!100 = !DILocation(line: 56, column: 23, scope: !45)
!101 = !DILocation(line: 57, column: 25, scope: !45)
!102 = !DILocation(line: 57, column: 44, scope: !45)
!103 = !DILocation(line: 57, column: 18, scope: !45)
!104 = !DILocation(line: 57, column: 5, scope: !45)
!105 = !DILocation(line: 57, column: 23, scope: !45)
!106 = !DILocation(line: 40, column: 27, scope: !46)
!107 = !DILocation(line: 40, column: 18, scope: !46)
!108 = distinct !{!108, !70, !109, !69}
!109 = !DILocation(line: 58, column: 3, scope: !47)
!110 = !DILocation(line: 59, column: 1, scope: !35)
!111 = distinct !DISubprogram(name: "sub_bytes", scope: !3, file: !3, line: 62, type: !112, scopeLine: 62, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !114)
!112 = !DISubroutineType(types: !113)
!113 = !{null, !38}
!114 = !{!115, !116}
!115 = !DILocalVariable(name: "state", arg: 1, scope: !111, file: !3, line: 62, type: !38)
!116 = !DILocalVariable(name: "i", scope: !117, file: !3, line: 63, type: !43)
!117 = distinct !DILexicalBlock(scope: !111, file: !3, line: 63, column: 3)
!118 = !DILocation(line: 0, scope: !111)
!119 = !DILocation(line: 0, scope: !117)
!120 = !DILocation(line: 63, column: 3, scope: !117)
!121 = !DILocation(line: 66, column: 1, scope: !111)
!122 = !DILocation(line: 64, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !3, line: 63, column: 32)
!124 = distinct !DILexicalBlock(scope: !117, file: !3, line: 63, column: 3)
!125 = !DILocation(line: 64, column: 16, scope: !123)
!126 = !DILocation(line: 64, column: 14, scope: !123)
!127 = !DILocation(line: 63, column: 28, scope: !124)
!128 = !DILocation(line: 63, column: 21, scope: !124)
!129 = distinct !{!129, !120, !130, !69}
!130 = !DILocation(line: 65, column: 3, scope: !117)
!131 = distinct !DISubprogram(name: "shift_rows", scope: !3, file: !3, line: 69, type: !112, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !132)
!132 = !{!133, !134}
!133 = !DILocalVariable(name: "state", arg: 1, scope: !131, file: !3, line: 69, type: !38)
!134 = !DILocalVariable(name: "temp", scope: !131, file: !3, line: 70, type: !18)
!135 = !DILocation(line: 0, scope: !131)
!136 = !DILocation(line: 71, column: 10, scope: !131)
!137 = !DILocation(line: 72, column: 14, scope: !131)
!138 = !DILocation(line: 72, column: 12, scope: !131)
!139 = !DILocation(line: 73, column: 14, scope: !131)
!140 = !DILocation(line: 73, column: 12, scope: !131)
!141 = !DILocation(line: 74, column: 14, scope: !131)
!142 = !DILocation(line: 74, column: 12, scope: !131)
!143 = !DILocation(line: 75, column: 13, scope: !131)
!144 = !DILocation(line: 76, column: 10, scope: !131)
!145 = !DILocation(line: 77, column: 14, scope: !131)
!146 = !DILocation(line: 77, column: 12, scope: !131)
!147 = !DILocation(line: 78, column: 13, scope: !131)
!148 = !DILocation(line: 79, column: 10, scope: !131)
!149 = !DILocation(line: 80, column: 14, scope: !131)
!150 = !DILocation(line: 80, column: 12, scope: !131)
!151 = !DILocation(line: 81, column: 13, scope: !131)
!152 = !DILocation(line: 82, column: 10, scope: !131)
!153 = !DILocation(line: 83, column: 15, scope: !131)
!154 = !DILocation(line: 83, column: 13, scope: !131)
!155 = !DILocation(line: 84, column: 15, scope: !131)
!156 = !DILocation(line: 84, column: 13, scope: !131)
!157 = !DILocation(line: 85, column: 14, scope: !131)
!158 = !DILocation(line: 85, column: 12, scope: !131)
!159 = !DILocation(line: 86, column: 12, scope: !131)
!160 = !DILocation(line: 87, column: 1, scope: !131)
!161 = distinct !DISubprogram(name: "gf_mult", scope: !3, file: !3, line: 90, type: !162, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !164)
!162 = !DISubroutineType(types: !163)
!163 = !{!18, !18, !18}
!164 = !{!165, !166, !167, !168, !170}
!165 = !DILocalVariable(name: "a", arg: 1, scope: !161, file: !3, line: 90, type: !18)
!166 = !DILocalVariable(name: "b", arg: 2, scope: !161, file: !3, line: 90, type: !18)
!167 = !DILocalVariable(name: "p", scope: !161, file: !3, line: 91, type: !18)
!168 = !DILocalVariable(name: "i", scope: !169, file: !3, line: 92, type: !43)
!169 = distinct !DILexicalBlock(scope: !161, file: !3, line: 92, column: 3)
!170 = !DILocalVariable(name: "hi_bit", scope: !171, file: !3, line: 95, type: !18)
!171 = distinct !DILexicalBlock(scope: !172, file: !3, line: 92, column: 31)
!172 = distinct !DILexicalBlock(scope: !169, file: !3, line: 92, column: 3)
!173 = !DILocation(line: 0, scope: !161)
!174 = !DILocation(line: 0, scope: !169)
!175 = !DILocation(line: 92, column: 3, scope: !169)
!176 = !DILocation(line: 93, column: 11, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !3, line: 93, column: 9)
!178 = !DILocation(line: 101, column: 3, scope: !161)
!179 = !DILocation(line: 0, scope: !171)
!180 = !DILocation(line: 96, column: 7, scope: !171)
!181 = !DILocation(line: 97, column: 9, scope: !182)
!182 = distinct !DILexicalBlock(scope: !171, file: !3, line: 97, column: 9)
!183 = !DILocation(line: 99, column: 7, scope: !171)
!184 = !DILocation(line: 92, column: 27, scope: !172)
!185 = !DILocation(line: 92, column: 21, scope: !172)
!186 = distinct !{!186, !175, !187, !69}
!187 = !DILocation(line: 100, column: 3, scope: !169)
!188 = distinct !DISubprogram(name: "mix_columns", scope: !3, file: !3, line: 105, type: !112, scopeLine: 105, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !189)
!189 = !{!190, !191, !195, !197, !200}
!190 = !DILocalVariable(name: "state", arg: 1, scope: !188, file: !3, line: 105, type: !38)
!191 = !DILocalVariable(name: "temp", scope: !188, file: !3, line: 106, type: !192)
!192 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 128, elements: !193)
!193 = !{!194}
!194 = !DISubrange(count: 16)
!195 = !DILocalVariable(name: "i", scope: !196, file: !3, line: 107, type: !43)
!196 = distinct !DILexicalBlock(scope: !188, file: !3, line: 107, column: 3)
!197 = !DILocalVariable(name: "idx", scope: !198, file: !3, line: 108, type: !43)
!198 = distinct !DILexicalBlock(scope: !199, file: !3, line: 107, column: 31)
!199 = distinct !DILexicalBlock(scope: !196, file: !3, line: 107, column: 3)
!200 = !DILocalVariable(name: "i", scope: !201, file: !3, line: 119, type: !43)
!201 = distinct !DILexicalBlock(scope: !188, file: !3, line: 119, column: 3)
!202 = distinct !DIAssignID()
!203 = !DILocation(line: 0, scope: !188)
!204 = !DILocation(line: 106, column: 3, scope: !188)
!205 = !DILocation(line: 0, scope: !196)
!206 = !DILocation(line: 107, column: 3, scope: !196)
!207 = !DILocation(line: 108, column: 17, scope: !198)
!208 = !DILocation(line: 0, scope: !198)
!209 = !DILocation(line: 109, column: 31, scope: !198)
!210 = !DILocation(line: 0, scope: !161, inlinedAt: !211)
!211 = distinct !DILocation(line: 109, column: 17, scope: !198)
!212 = !DILocation(line: 0, scope: !169, inlinedAt: !211)
!213 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !211)
!214 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !211)
!215 = !DILocation(line: 0, scope: !171, inlinedAt: !211)
!216 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !211)
!217 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !211)
!218 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !211)
!219 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !211)
!220 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !211)
!221 = distinct !{!221, !213, !222, !69}
!222 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !211)
!223 = !DILocation(line: 109, column: 69, scope: !198)
!224 = !DILocation(line: 109, column: 59, scope: !198)
!225 = !DILocation(line: 0, scope: !161, inlinedAt: !226)
!226 = distinct !DILocation(line: 109, column: 45, scope: !198)
!227 = !DILocation(line: 0, scope: !169, inlinedAt: !226)
!228 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !226)
!229 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !226)
!230 = !DILocation(line: 0, scope: !171, inlinedAt: !226)
!231 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !226)
!232 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !226)
!233 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !226)
!234 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !226)
!235 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !226)
!236 = distinct !{!236, !228, !237, !69}
!237 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !226)
!238 = !DILocation(line: 109, column: 43, scope: !198)
!239 = !DILocation(line: 110, column: 27, scope: !198)
!240 = !DILocation(line: 110, column: 17, scope: !198)
!241 = !DILocation(line: 109, column: 75, scope: !198)
!242 = !DILocation(line: 110, column: 44, scope: !198)
!243 = !DILocation(line: 110, column: 34, scope: !198)
!244 = !DILocation(line: 110, column: 32, scope: !198)
!245 = !DILocation(line: 109, column: 5, scope: !198)
!246 = !DILocation(line: 109, column: 15, scope: !198)
!247 = !DILocation(line: 0, scope: !161, inlinedAt: !248)
!248 = distinct !DILocation(line: 111, column: 34, scope: !198)
!249 = !DILocation(line: 0, scope: !169, inlinedAt: !248)
!250 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !248)
!251 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !248)
!252 = !DILocation(line: 0, scope: !171, inlinedAt: !248)
!253 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !248)
!254 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !248)
!255 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !248)
!256 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !248)
!257 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !248)
!258 = distinct !{!258, !250, !259, !69}
!259 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !248)
!260 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !261)
!261 = distinct !DILocation(line: 112, column: 21, scope: !198)
!262 = !DILocation(line: 0, scope: !161, inlinedAt: !261)
!263 = !DILocation(line: 0, scope: !169, inlinedAt: !261)
!264 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !261)
!265 = !DILocation(line: 0, scope: !171, inlinedAt: !261)
!266 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !261)
!267 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !261)
!268 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !261)
!269 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !261)
!270 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !261)
!271 = distinct !{!271, !260, !272, !69}
!272 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !261)
!273 = !DILocation(line: 111, column: 32, scope: !198)
!274 = !DILocation(line: 111, column: 64, scope: !198)
!275 = !DILocation(line: 112, column: 51, scope: !198)
!276 = !DILocation(line: 111, column: 5, scope: !198)
!277 = !DILocation(line: 111, column: 19, scope: !198)
!278 = !DILocation(line: 0, scope: !161, inlinedAt: !279)
!279 = distinct !DILocation(line: 114, column: 21, scope: !198)
!280 = !DILocation(line: 0, scope: !169, inlinedAt: !279)
!281 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !279)
!282 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !279)
!283 = !DILocation(line: 0, scope: !171, inlinedAt: !279)
!284 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !279)
!285 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !279)
!286 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !279)
!287 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !279)
!288 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !279)
!289 = distinct !{!289, !281, !290, !69}
!290 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !279)
!291 = !DILocation(line: 113, column: 32, scope: !198)
!292 = !DILocation(line: 0, scope: !161, inlinedAt: !293)
!293 = distinct !DILocation(line: 115, column: 21, scope: !198)
!294 = !DILocation(line: 0, scope: !169, inlinedAt: !293)
!295 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !293)
!296 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !293)
!297 = !DILocation(line: 0, scope: !171, inlinedAt: !293)
!298 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !293)
!299 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !293)
!300 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !293)
!301 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !293)
!302 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !293)
!303 = distinct !{!303, !295, !304, !69}
!304 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !293)
!305 = !DILocation(line: 113, column: 49, scope: !198)
!306 = !DILocation(line: 114, column: 51, scope: !198)
!307 = !DILocation(line: 113, column: 5, scope: !198)
!308 = !DILocation(line: 113, column: 19, scope: !198)
!309 = !DILocation(line: 0, scope: !161, inlinedAt: !310)
!310 = distinct !DILocation(line: 116, column: 21, scope: !198)
!311 = !DILocation(line: 0, scope: !169, inlinedAt: !310)
!312 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !310)
!313 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !310)
!314 = !DILocation(line: 0, scope: !171, inlinedAt: !310)
!315 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !310)
!316 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !310)
!317 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !310)
!318 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !310)
!319 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !310)
!320 = distinct !{!320, !312, !321, !69}
!321 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !310)
!322 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !323)
!323 = distinct !DILocation(line: 117, column: 38, scope: !198)
!324 = !DILocation(line: 0, scope: !161, inlinedAt: !323)
!325 = !DILocation(line: 0, scope: !169, inlinedAt: !323)
!326 = !DILocation(line: 93, column: 11, scope: !177, inlinedAt: !323)
!327 = !DILocation(line: 0, scope: !171, inlinedAt: !323)
!328 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !323)
!329 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !323)
!330 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !323)
!331 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !323)
!332 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !323)
!333 = distinct !{!333, !322, !334, !69}
!334 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !323)
!335 = !DILocation(line: 116, column: 47, scope: !198)
!336 = !DILocation(line: 116, column: 64, scope: !198)
!337 = !DILocation(line: 117, column: 36, scope: !198)
!338 = !DILocation(line: 116, column: 5, scope: !198)
!339 = !DILocation(line: 116, column: 19, scope: !198)
!340 = !DILocation(line: 107, column: 27, scope: !199)
!341 = !DILocation(line: 107, column: 21, scope: !199)
!342 = distinct !{!342, !206, !343, !69}
!343 = !DILocation(line: 118, column: 3, scope: !196)
!344 = !DILocation(line: 120, column: 14, scope: !345)
!345 = distinct !DILexicalBlock(scope: !346, file: !3, line: 119, column: 32)
!346 = distinct !DILexicalBlock(scope: !201, file: !3, line: 119, column: 3)
!347 = !DILocation(line: 0, scope: !201)
!348 = !DILocation(line: 122, column: 1, scope: !188)
!349 = distinct !DISubprogram(name: "add_round_key", scope: !3, file: !3, line: 125, type: !36, scopeLine: 125, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !350)
!350 = !{!351, !352, !353}
!351 = !DILocalVariable(name: "state", arg: 1, scope: !349, file: !3, line: 125, type: !38)
!352 = !DILocalVariable(name: "round_key", arg: 2, scope: !349, file: !3, line: 125, type: !38)
!353 = !DILocalVariable(name: "i", scope: !354, file: !3, line: 126, type: !43)
!354 = distinct !DILexicalBlock(scope: !349, file: !3, line: 126, column: 3)
!355 = !DILocation(line: 0, scope: !349)
!356 = !DILocation(line: 0, scope: !354)
!357 = !DILocation(line: 126, column: 3, scope: !354)
!358 = !DILocation(line: 129, column: 1, scope: !349)
!359 = !DILocation(line: 127, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !361, file: !3, line: 126, column: 32)
!361 = distinct !DILexicalBlock(scope: !354, file: !3, line: 126, column: 3)
!362 = !DILocation(line: 127, column: 5, scope: !360)
!363 = !DILocation(line: 127, column: 14, scope: !360)
!364 = !DILocation(line: 126, column: 28, scope: !361)
!365 = !DILocation(line: 126, column: 21, scope: !361)
!366 = distinct !{!366, !357, !367, !69}
!367 = !DILocation(line: 128, column: 3, scope: !354)
!368 = distinct !DISubprogram(name: "aes128_encrypt_block", scope: !3, file: !3, line: 157, type: !369, scopeLine: 158, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !371)
!369 = !DISubroutineType(types: !370)
!370 = !{null, !38, !38, !38}
!371 = !{!372, !373, !374, !375, !376, !378, !381, !382, !383}
!372 = !DILocalVariable(name: "plaintext", arg: 1, scope: !368, file: !3, line: 157, type: !38)
!373 = !DILocalVariable(name: "round_keys", arg: 2, scope: !368, file: !3, line: 157, type: !38)
!374 = !DILocalVariable(name: "ciphertext", arg: 3, scope: !368, file: !3, line: 158, type: !38)
!375 = !DILocalVariable(name: "state", scope: !368, file: !3, line: 159, type: !192)
!376 = !DILocalVariable(name: "round", scope: !377, file: !3, line: 167, type: !43)
!377 = distinct !DILexicalBlock(scope: !368, file: !3, line: 167, column: 3)
!378 = !DILocalVariable(name: "state_ptr", scope: !379, file: !3, line: 168, type: !5)
!379 = distinct !DILexicalBlock(scope: !380, file: !3, line: 167, column: 44)
!380 = distinct !DILexicalBlock(scope: !377, file: !3, line: 167, column: 3)
!381 = !DILocalVariable(name: "round_key_ptr", scope: !379, file: !3, line: 169, type: !5)
!382 = !DILocalVariable(name: "final_state_ptr", scope: !368, file: !3, line: 230, type: !5)
!383 = !DILocalVariable(name: "final_round_key_ptr", scope: !368, file: !3, line: 231, type: !5)
!384 = distinct !DIAssignID()
!385 = !DILocation(line: 0, scope: !368)
!386 = !DILocation(line: 159, column: 3, scope: !368)
!387 = !DILocation(line: 160, column: 3, scope: !368)
!388 = distinct !DIAssignID()
!389 = !DILocation(line: 0, scope: !349, inlinedAt: !390)
!390 = distinct !DILocation(line: 163, column: 3, scope: !368)
!391 = !DILocation(line: 0, scope: !354, inlinedAt: !390)
!392 = !DILocation(line: 126, column: 3, scope: !354, inlinedAt: !390)
!393 = !DILocation(line: 127, column: 17, scope: !360, inlinedAt: !390)
!394 = !DILocation(line: 127, column: 5, scope: !360, inlinedAt: !390)
!395 = !DILocation(line: 127, column: 14, scope: !360, inlinedAt: !390)
!396 = !DILocation(line: 126, column: 28, scope: !361, inlinedAt: !390)
!397 = !DILocation(line: 126, column: 21, scope: !361, inlinedAt: !390)
!398 = distinct !{!398, !392, !399, !69}
!399 = !DILocation(line: 128, column: 3, scope: !354, inlinedAt: !390)
!400 = !{!401, !401, i64 0}
!401 = !{!"int", !61, i64 0}
!402 = !DILocation(line: 0, scope: !377)
!403 = !DILocation(line: 167, column: 3, scope: !377)
!404 = !DILocation(line: 0, scope: !379)
!405 = !DILocation(line: 169, column: 44, scope: !379)
!406 = !DILocation(line: 171, column: 5, scope: !379)
!407 = !{i64 5904}
!408 = !DILocation(line: 176, column: 51, scope: !379)
!409 = !DILocation(line: 174, column: 5, scope: !379)
!410 = !{i64 6075}
!411 = !DILocation(line: 179, column: 51, scope: !379)
!412 = !DILocation(line: 177, column: 5, scope: !379)
!413 = !{i64 6246}
!414 = !DILocation(line: 182, column: 51, scope: !379)
!415 = !DILocation(line: 180, column: 5, scope: !379)
!416 = !{i64 6417}
!417 = !DILocation(line: 185, column: 29, scope: !379)
!418 = !DILocation(line: 184, column: 5, scope: !379)
!419 = !{i64 6590}
!420 = !DILocation(line: 187, column: 5, scope: !379)
!421 = !{i64 6761}
!422 = !DILocation(line: 190, column: 5, scope: !379)
!423 = !{i64 6932}
!424 = !DILocation(line: 193, column: 5, scope: !379)
!425 = !{i64 7103}
!426 = !DILocation(line: 198, column: 29, scope: !379)
!427 = !DILocation(line: 197, column: 5, scope: !379)
!428 = !{i64 7276}
!429 = !DILocation(line: 200, column: 5, scope: !379)
!430 = !{i64 7447}
!431 = !DILocation(line: 203, column: 5, scope: !379)
!432 = !{i64 7618}
!433 = !DILocation(line: 206, column: 5, scope: !379)
!434 = !{i64 7789}
!435 = !DILocation(line: 211, column: 29, scope: !379)
!436 = !DILocation(line: 210, column: 5, scope: !379)
!437 = !{i64 7962}
!438 = !DILocation(line: 213, column: 5, scope: !379)
!439 = !{i64 8133}
!440 = !DILocation(line: 216, column: 5, scope: !379)
!441 = !{i64 8304}
!442 = !DILocation(line: 219, column: 5, scope: !379)
!443 = !{i64 8475}
!444 = !DILocation(line: 223, column: 20, scope: !379)
!445 = !DILocation(line: 224, column: 20, scope: !379)
!446 = !DILocation(line: 224, column: 18, scope: !379)
!447 = !DILocation(line: 225, column: 20, scope: !379)
!448 = !DILocation(line: 225, column: 18, scope: !379)
!449 = !DILocation(line: 226, column: 18, scope: !379)
!450 = !DILocation(line: 231, column: 48, scope: !368)
!451 = !DILocation(line: 234, column: 3, scope: !368)
!452 = !{i64 9127}
!453 = !DILocation(line: 238, column: 3, scope: !368)
!454 = !{i64 9331}
!455 = !DILocation(line: 242, column: 3, scope: !368)
!456 = !{i64 9535}
!457 = !DILocation(line: 246, column: 3, scope: !368)
!458 = !{i64 9739}
!459 = !DILocation(line: 251, column: 27, scope: !368)
!460 = !DILocation(line: 250, column: 3, scope: !368)
!461 = !{i64 9943}
!462 = !DILocation(line: 254, column: 3, scope: !368)
!463 = !{i64 10147}
!464 = !DILocation(line: 258, column: 3, scope: !368)
!465 = !{i64 10351}
!466 = !DILocation(line: 262, column: 3, scope: !368)
!467 = !{i64 10555}
!468 = !DILocation(line: 267, column: 27, scope: !368)
!469 = !DILocation(line: 266, column: 3, scope: !368)
!470 = !{i64 10759}
!471 = !DILocation(line: 270, column: 3, scope: !368)
!472 = !{i64 10963}
!473 = !DILocation(line: 274, column: 3, scope: !368)
!474 = !{i64 11167}
!475 = !DILocation(line: 278, column: 3, scope: !368)
!476 = !{i64 11371}
!477 = !DILocation(line: 283, column: 27, scope: !368)
!478 = !DILocation(line: 282, column: 3, scope: !368)
!479 = !{i64 11575}
!480 = !DILocation(line: 286, column: 3, scope: !368)
!481 = !{i64 11779}
!482 = !DILocation(line: 290, column: 3, scope: !368)
!483 = !{i64 11983}
!484 = !DILocation(line: 294, column: 3, scope: !368)
!485 = !{i64 12187}
!486 = !DILocation(line: 299, column: 3, scope: !368)
!487 = !DILocation(line: 300, column: 1, scope: !368)
!488 = distinct !DISubprogram(name: "aes128_ecb_encrypt", scope: !3, file: !3, line: 303, type: !489, scopeLine: 304, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !495)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !38, !491, !38, !38}
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !492, line: 40, baseType: !493)
!492 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/strings.h", directory: "", checksumkind: CSK_MD5, checksum: "dceb1b71cd72987b246237af8552faba")
!493 = !DIDerivedType(tag: DW_TAG_typedef, name: "__size_t", file: !494, line: 131, baseType: !10)
!494 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "17b5691773b3e3881dfdbe392c9e8d43")
!495 = !{!496, !497, !498, !499, !500, !504, !505, !507}
!496 = !DILocalVariable(name: "plaintext", arg: 1, scope: !488, file: !3, line: 303, type: !38)
!497 = !DILocalVariable(name: "len", arg: 2, scope: !488, file: !3, line: 303, type: !491)
!498 = !DILocalVariable(name: "key", arg: 3, scope: !488, file: !3, line: 303, type: !38)
!499 = !DILocalVariable(name: "ciphertext", arg: 4, scope: !488, file: !3, line: 304, type: !38)
!500 = !DILocalVariable(name: "round_keys", scope: !488, file: !3, line: 311, type: !501)
!501 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1408, elements: !502)
!502 = !{!503}
!503 = !DISubrange(count: 176)
!504 = !DILocalVariable(name: "copy_key", scope: !488, file: !3, line: 312, type: !501)
!505 = !DILocalVariable(name: "i", scope: !506, file: !3, line: 315, type: !491)
!506 = distinct !DILexicalBlock(scope: !488, file: !3, line: 315, column: 3)
!507 = !DILocalVariable(name: "z", scope: !508, file: !3, line: 316, type: !491)
!508 = distinct !DILexicalBlock(scope: !509, file: !3, line: 316, column: 5)
!509 = distinct !DILexicalBlock(scope: !510, file: !3, line: 315, column: 40)
!510 = distinct !DILexicalBlock(scope: !506, file: !3, line: 315, column: 3)
!511 = distinct !DIAssignID()
!512 = !DILocation(line: 0, scope: !488)
!513 = distinct !DIAssignID()
!514 = !DILocation(line: 305, column: 11, scope: !515)
!515 = distinct !DILexicalBlock(scope: !488, file: !3, line: 305, column: 7)
!516 = !DILocation(line: 305, column: 16, scope: !515)
!517 = !DILocation(line: 311, column: 3, scope: !488)
!518 = !DILocation(line: 312, column: 3, scope: !488)
!519 = !DILocation(line: 313, column: 3, scope: !488)
!520 = !DILocation(line: 0, scope: !506)
!521 = !DILocation(line: 315, column: 24, scope: !510)
!522 = !DILocation(line: 315, column: 3, scope: !506)
!523 = !DILocation(line: 0, scope: !508)
!524 = !DILocation(line: 317, column: 19, scope: !525)
!525 = distinct !DILexicalBlock(scope: !526, file: !3, line: 316, column: 38)
!526 = distinct !DILexicalBlock(scope: !508, file: !3, line: 316, column: 5)
!527 = !DILocation(line: 319, column: 27, scope: !509)
!528 = !DILocation(line: 319, column: 52, scope: !509)
!529 = !DILocation(line: 319, column: 5, scope: !509)
!530 = !DILocation(line: 315, column: 33, scope: !510)
!531 = distinct !{!531, !522, !532, !69}
!532 = !DILocation(line: 320, column: 3, scope: !506)
!533 = !DILocation(line: 321, column: 1, scope: !488)
!534 = distinct !DISubprogram(name: "write_to_address", scope: !3, file: !3, line: 323, type: !535, scopeLine: 323, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !539)
!535 = !DISubroutineType(types: !536)
!536 = !{null, !537, !6}
!537 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !7, line: 82, baseType: !538)
!538 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintptr_t", file: !9, line: 232, baseType: !10)
!539 = !{!540, !541}
!540 = !DILocalVariable(name: "addr", arg: 1, scope: !534, file: !3, line: 323, type: !537)
!541 = !DILocalVariable(name: "value", arg: 2, scope: !534, file: !3, line: 323, type: !6)
!542 = !DILocation(line: 0, scope: !534)
!543 = !DILocation(line: 324, column: 4, scope: !534)
!544 = !DILocation(line: 324, column: 30, scope: !534)
!545 = !DILocation(line: 325, column: 1, scope: !534)
!546 = distinct !DISubprogram(name: "write_v_to_address", scope: !3, file: !3, line: 327, type: !547, scopeLine: 327, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !549)
!547 = !DISubroutineType(types: !548)
!548 = !{null, !537, !38}
!549 = !{!550, !551, !552, !553}
!550 = !DILocalVariable(name: "addr", arg: 1, scope: !546, file: !3, line: 327, type: !537)
!551 = !DILocalVariable(name: "vector", arg: 2, scope: !546, file: !3, line: 327, type: !38)
!552 = !DILocalVariable(name: "vector_word", scope: !546, file: !3, line: 328, type: !5)
!553 = !DILocalVariable(name: "i", scope: !554, file: !3, line: 329, type: !43)
!554 = distinct !DILexicalBlock(scope: !546, file: !3, line: 329, column: 3)
!555 = !DILocation(line: 0, scope: !546)
!556 = !DILocation(line: 0, scope: !554)
!557 = !DILocation(line: 329, column: 3, scope: !554)
!558 = !DILocation(line: 332, column: 1, scope: !546)
!559 = !DILocation(line: 330, column: 31, scope: !560)
!560 = distinct !DILexicalBlock(scope: !561, file: !3, line: 329, column: 31)
!561 = distinct !DILexicalBlock(scope: !554, file: !3, line: 329, column: 3)
!562 = !DILocation(line: 330, column: 27, scope: !560)
!563 = !DILocation(line: 330, column: 38, scope: !560)
!564 = !DILocation(line: 0, scope: !534, inlinedAt: !565)
!565 = distinct !DILocation(line: 330, column: 5, scope: !560)
!566 = !DILocation(line: 324, column: 4, scope: !534, inlinedAt: !565)
!567 = !DILocation(line: 324, column: 30, scope: !534, inlinedAt: !565)
!568 = !DILocation(line: 329, column: 27, scope: !561)
!569 = !DILocation(line: 329, column: 21, scope: !561)
!570 = distinct !{!570, !557, !571, !69}
!571 = !DILocation(line: 331, column: 3, scope: !554)
!572 = distinct !DISubprogram(name: "write_numb_to_address", scope: !3, file: !3, line: 334, type: !547, scopeLine: 334, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !573)
!573 = !{!574, !575, !576}
!574 = !DILocalVariable(name: "addr", arg: 1, scope: !572, file: !3, line: 334, type: !537)
!575 = !DILocalVariable(name: "vector", arg: 2, scope: !572, file: !3, line: 334, type: !38)
!576 = !DILocalVariable(name: "vector_word", scope: !572, file: !3, line: 335, type: !5)
!577 = !DILocation(line: 0, scope: !572)
!578 = !DILocation(line: 336, column: 26, scope: !572)
!579 = !DILocation(line: 0, scope: !534, inlinedAt: !580)
!580 = distinct !DILocation(line: 336, column: 3, scope: !572)
!581 = !DILocation(line: 324, column: 4, scope: !534, inlinedAt: !580)
!582 = !DILocation(line: 324, column: 30, scope: !534, inlinedAt: !580)
!583 = !DILocation(line: 337, column: 1, scope: !572)
!584 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 339, type: !585, scopeLine: 339, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !587)
!585 = !DISubroutineType(types: !586)
!586 = !{!43}
!587 = !{!588, !589, !590, !591, !592, !593, !594, !595}
!588 = !DILocalVariable(name: "plaintext", scope: !584, file: !3, line: 341, type: !192)
!589 = !DILocalVariable(name: "key", scope: !584, file: !3, line: 344, type: !192)
!590 = !DILocalVariable(name: "expected_output", scope: !584, file: !3, line: 346, type: !192)
!591 = !DILocalVariable(name: "ciphertext", scope: !584, file: !3, line: 349, type: !192)
!592 = !DILocalVariable(name: "len", scope: !584, file: !3, line: 350, type: !491)
!593 = !DILocalVariable(name: "addr", scope: !584, file: !3, line: 352, type: !537)
!594 = !DILocalVariable(name: "value", scope: !584, file: !3, line: 353, type: !6)
!595 = !DILocalVariable(name: "i", scope: !596, file: !3, line: 383, type: !43)
!596 = distinct !DILexicalBlock(scope: !584, file: !3, line: 383, column: 3)
!597 = distinct !DIAssignID()
!598 = !DILocation(line: 0, scope: !584)
!599 = distinct !DIAssignID()
!600 = distinct !DIAssignID()
!601 = distinct !DIAssignID()
!602 = distinct !DIAssignID()
!603 = distinct !DIAssignID()
!604 = distinct !DIAssignID()
!605 = !DILocation(line: 349, column: 3, scope: !584)
!606 = !DILocation(line: 355, column: 3, scope: !584)
!607 = !DILocation(line: 0, scope: !546, inlinedAt: !608)
!608 = distinct !DILocation(line: 358, column: 3, scope: !584)
!609 = !DILocation(line: 0, scope: !554, inlinedAt: !608)
!610 = !DILocation(line: 0, scope: !534, inlinedAt: !611)
!611 = distinct !DILocation(line: 330, column: 5, scope: !560, inlinedAt: !608)
!612 = !DILocation(line: 324, column: 30, scope: !534, inlinedAt: !611)
!613 = !DILocation(line: 0, scope: !554, inlinedAt: !614)
!614 = distinct !DILocation(line: 361, column: 3, scope: !584)
!615 = !DILocation(line: 330, column: 38, scope: !560, inlinedAt: !614)
!616 = !DILocation(line: 0, scope: !534, inlinedAt: !617)
!617 = distinct !DILocation(line: 330, column: 5, scope: !560, inlinedAt: !614)
!618 = !DILocation(line: 324, column: 30, scope: !534, inlinedAt: !617)
!619 = !DILocation(line: 383, column: 3, scope: !596)
!620 = !DILocation(line: 383, column: 28, scope: !621)
!621 = distinct !DILexicalBlock(scope: !596, file: !3, line: 383, column: 3)
!622 = !DILocation(line: 0, scope: !596)
!623 = !DILocation(line: 383, column: 21, scope: !621)
!624 = distinct !{!624, !619, !625, !69}
!625 = !DILocation(line: 388, column: 3, scope: !596)
!626 = !DILocation(line: 384, column: 9, scope: !627)
!627 = distinct !DILexicalBlock(scope: !628, file: !3, line: 384, column: 9)
!628 = distinct !DILexicalBlock(scope: !621, file: !3, line: 383, column: 32)
!629 = !DILocation(line: 384, column: 26, scope: !627)
!630 = !DILocation(line: 384, column: 23, scope: !627)
!631 = !DILocation(line: 0, scope: !534, inlinedAt: !632)
!632 = distinct !DILocation(line: 389, column: 3, scope: !584)
!633 = !DILocation(line: 324, column: 30, scope: !534, inlinedAt: !632)
!634 = !DILocation(line: 0, scope: !534, inlinedAt: !635)
!635 = distinct !DILocation(line: 395, column: 3, scope: !584)
!636 = !DILocation(line: 324, column: 30, scope: !534, inlinedAt: !635)
!637 = !DILocation(line: 398, column: 1, scope: !584)

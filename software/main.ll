; ModuleID = 'main.c'
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

3:                                                ; preds = %2, %3
  %4 = phi i32 [ 0, %2 ], [ %8, %3 ]
    #dbg_value(i32 %4, !42, !DIExpression(), !54)
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 %4, !dbg !57
  %6 = load i8, ptr %5, align 1, !dbg !57, !tbaa !60
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 %4, !dbg !63
  store i8 %6, ptr %7, align 1, !dbg !64, !tbaa !60
  %8 = add nuw nsw i32 %4, 1, !dbg !65
    #dbg_value(i32 %8, !42, !DIExpression(), !54)
  %9 = icmp eq i32 %8, 16, !dbg !66
  br i1 %9, label %10, label %3, !dbg !55, !llvm.loop !67

10:                                               ; preds = %3, %41
  %11 = phi i32 [ %64, %41 ], [ 16, %3 ]
    #dbg_value(i32 %11, !42, !DIExpression(), !54)
  %12 = getelementptr i8, ptr %1, i32 %11, !dbg !70
  %13 = getelementptr i8, ptr %12, i32 -4, !dbg !70
  %14 = load i8, ptr %13, align 1, !dbg !70, !tbaa !60
    #dbg_value(i8 %14, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !71)
  %15 = getelementptr i8, ptr %12, i32 -3, !dbg !72
  %16 = load i8, ptr %15, align 1, !dbg !72, !tbaa !60
    #dbg_value(i8 %16, !44, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !71)
  %17 = getelementptr i8, ptr %12, i32 -2, !dbg !73
  %18 = load i8, ptr %17, align 1, !dbg !73, !tbaa !60
    #dbg_value(i8 %18, !44, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !71)
  %19 = getelementptr i8, ptr %12, i32 -1, !dbg !74
  %20 = load i8, ptr %19, align 1, !dbg !74, !tbaa !60
    #dbg_value(i8 %20, !44, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !71)
  %21 = and i32 %11, 12, !dbg !75
  %22 = icmp eq i32 %21, 0, !dbg !76
  br i1 %22, label %23, label %41, !dbg !76

23:                                               ; preds = %10
    #dbg_value(i8 %14, !51, !DIExpression(), !77)
  %24 = zext i8 %16 to i32, !dbg !78
  %25 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %24, !dbg !78
  %26 = load i8, ptr %25, align 1, !dbg !78, !tbaa !60
    #dbg_value(i8 %26, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !71)
  %27 = zext i8 %18 to i32, !dbg !79
  %28 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %27, !dbg !79
  %29 = load i8, ptr %28, align 1, !dbg !79, !tbaa !60
    #dbg_value(i8 %29, !44, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !71)
  %30 = zext i8 %20 to i32, !dbg !80
  %31 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %30, !dbg !80
  %32 = load i8, ptr %31, align 1, !dbg !80, !tbaa !60
    #dbg_value(i8 %32, !44, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !71)
  %33 = zext i8 %14 to i32, !dbg !81
  %34 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i32 0, i32 %33, !dbg !81
  %35 = load i8, ptr %34, align 1, !dbg !81, !tbaa !60
    #dbg_value(i8 %35, !44, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !71)
  %36 = lshr exact i32 %11, 4, !dbg !82
  %37 = add nsw i32 %36, -1, !dbg !83
  %38 = getelementptr inbounds [10 x i8], ptr @rcon, i32 0, i32 %37, !dbg !84
  %39 = load i8, ptr %38, align 1, !dbg !84, !tbaa !60
  %40 = xor i8 %39, %26, !dbg !85
    #dbg_value(i8 %40, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !71)
  br label %41, !dbg !86

41:                                               ; preds = %23, %10
  %42 = phi i8 [ %35, %23 ], [ %20, %10 ], !dbg !71
  %43 = phi i8 [ %32, %23 ], [ %18, %10 ], !dbg !71
  %44 = phi i8 [ %29, %23 ], [ %16, %10 ], !dbg !71
  %45 = phi i8 [ %40, %23 ], [ %14, %10 ], !dbg !71
    #dbg_value(i8 %45, !44, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !71)
    #dbg_value(i8 %44, !44, !DIExpression(DW_OP_LLVM_fragment, 8, 8), !71)
    #dbg_value(i8 %43, !44, !DIExpression(DW_OP_LLVM_fragment, 16, 8), !71)
    #dbg_value(i8 %42, !44, !DIExpression(DW_OP_LLVM_fragment, 24, 8), !71)
  %46 = getelementptr i8, ptr %12, i32 -16, !dbg !87
  %47 = load i8, ptr %46, align 1, !dbg !87, !tbaa !60
  %48 = xor i8 %47, %45, !dbg !88
  store i8 %48, ptr %12, align 1, !dbg !89, !tbaa !60
  %49 = getelementptr i8, ptr %12, i32 -15, !dbg !90
  %50 = load i8, ptr %49, align 1, !dbg !90, !tbaa !60
  %51 = xor i8 %50, %44, !dbg !91
  %52 = or disjoint i32 %11, 1, !dbg !92
  %53 = getelementptr inbounds nuw i8, ptr %1, i32 %52, !dbg !93
  store i8 %51, ptr %53, align 1, !dbg !94, !tbaa !60
  %54 = getelementptr i8, ptr %12, i32 -14, !dbg !95
  %55 = load i8, ptr %54, align 1, !dbg !95, !tbaa !60
  %56 = xor i8 %55, %43, !dbg !96
  %57 = or disjoint i32 %11, 2, !dbg !97
  %58 = getelementptr inbounds nuw i8, ptr %1, i32 %57, !dbg !98
  store i8 %56, ptr %58, align 1, !dbg !99, !tbaa !60
  %59 = getelementptr i8, ptr %12, i32 -13, !dbg !100
  %60 = load i8, ptr %59, align 1, !dbg !100, !tbaa !60
  %61 = xor i8 %60, %42, !dbg !101
  %62 = or disjoint i32 %11, 3, !dbg !102
  %63 = getelementptr inbounds nuw i8, ptr %1, i32 %62, !dbg !103
  store i8 %61, ptr %63, align 1, !dbg !104, !tbaa !60
  %64 = add nuw nsw i32 %11, 4, !dbg !105
    #dbg_value(i32 %64, !42, !DIExpression(), !54)
  %65 = icmp samesign ult i32 %11, 172, !dbg !106
  br i1 %65, label %10, label %66, !dbg !107, !llvm.loop !108

66:                                               ; preds = %41
  ret void, !dbg !110
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define dso_local void @sub_bytes(ptr nocapture noundef %0) local_unnamed_addr #0 !dbg !111 {
    #dbg_value(ptr %0, !115, !DIExpression(), !118)
    #dbg_value(i32 0, !116, !DIExpression(), !119)
  br label %3, !dbg !120

2:                                                ; preds = %3
  ret void, !dbg !121

3:                                                ; preds = %1, %3
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
  ret i8 %12, !dbg !176

4:                                                ; preds = %2, %4
  %5 = phi i8 [ %0, %2 ], [ %16, %4 ]
  %6 = phi i32 [ 0, %2 ], [ %18, %4 ]
  %7 = phi i8 [ 0, %2 ], [ %12, %4 ]
  %8 = phi i8 [ %1, %2 ], [ %17, %4 ]
    #dbg_value(i8 %5, !165, !DIExpression(), !173)
    #dbg_value(i32 %6, !168, !DIExpression(), !174)
    #dbg_value(i8 %7, !167, !DIExpression(), !173)
    #dbg_value(i8 %8, !166, !DIExpression(), !173)
  %9 = and i8 %8, 1, !dbg !177
  %10 = icmp eq i8 %9, 0, !dbg !177
  %11 = select i1 %10, i8 0, i8 %5, !dbg !177
  %12 = xor i8 %11, %7, !dbg !177
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

3:                                                ; preds = %1, %162
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
  %45 = xor i8 %36, %16, !dbg !238
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
  br i1 %70, label %71, label %55, !dbg !250, !llvm.loop !258

71:                                               ; preds = %55, %71
  %72 = phi i8 [ %83, %71 ], [ 3, %55 ]
  %73 = phi i32 [ %85, %71 ], [ 0, %55 ]
  %74 = phi i8 [ %79, %71 ], [ 0, %55 ]
  %75 = phi i8 [ %84, %71 ], [ %48, %55 ]
    #dbg_value(i8 %72, !165, !DIExpression(), !260)
    #dbg_value(i32 %73, !168, !DIExpression(), !262)
    #dbg_value(i8 %74, !167, !DIExpression(), !260)
    #dbg_value(i8 %75, !166, !DIExpression(), !260)
  %76 = and i8 %75, 1, !dbg !263
  %77 = icmp eq i8 %76, 0, !dbg !263
  %78 = select i1 %77, i8 0, i8 %72, !dbg !263
  %79 = xor i8 %78, %74, !dbg !263
    #dbg_value(i8 %79, !167, !DIExpression(), !260)
    #dbg_value(i8 %72, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !264)
  %80 = shl i8 %72, 1, !dbg !265
    #dbg_value(i8 %80, !165, !DIExpression(), !260)
  %81 = xor i8 %80, 27, !dbg !266
  %82 = icmp slt i8 %72, 0, !dbg !266
  %83 = select i1 %82, i8 %81, i8 %80, !dbg !266
    #dbg_value(i8 %83, !165, !DIExpression(), !260)
  %84 = lshr i8 %75, 1, !dbg !267
    #dbg_value(i8 %84, !166, !DIExpression(), !260)
  %85 = add nuw nsw i32 %73, 1, !dbg !268
    #dbg_value(i32 %85, !168, !DIExpression(), !262)
  %86 = icmp eq i32 %85, 8, !dbg !269
  br i1 %86, label %87, label %71, !dbg !270, !llvm.loop !271

87:                                               ; preds = %71
  %88 = xor i8 %52, %7, !dbg !273
  %89 = xor i8 %88, %63, !dbg !274
  %90 = xor i8 %89, %79, !dbg !275
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
  %127 = xor i8 %109, %100, !dbg !305
  %128 = xor i8 %127, %118, !dbg !306
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
  br i1 %145, label %146, label %130, !dbg !312, !llvm.loop !320

146:                                              ; preds = %130, %146
  %147 = phi i8 [ %158, %146 ], [ 2, %130 ]
  %148 = phi i32 [ %160, %146 ], [ 0, %130 ]
  %149 = phi i8 [ %154, %146 ], [ 0, %130 ]
  %150 = phi i8 [ %159, %146 ], [ %52, %130 ]
    #dbg_value(i8 %147, !165, !DIExpression(), !322)
    #dbg_value(i32 %148, !168, !DIExpression(), !324)
    #dbg_value(i8 %149, !167, !DIExpression(), !322)
    #dbg_value(i8 %150, !166, !DIExpression(), !322)
  %151 = and i8 %150, 1, !dbg !325
  %152 = icmp eq i8 %151, 0, !dbg !325
  %153 = select i1 %152, i8 0, i8 %147, !dbg !325
  %154 = xor i8 %153, %149, !dbg !325
    #dbg_value(i8 %154, !167, !DIExpression(), !322)
    #dbg_value(i8 %147, !170, !DIExpression(DW_OP_constu, 18446744073709551488, DW_OP_and, DW_OP_stack_value), !326)
  %155 = shl i8 %147, 1, !dbg !327
    #dbg_value(i8 %155, !165, !DIExpression(), !322)
  %156 = xor i8 %155, 27, !dbg !328
  %157 = icmp slt i8 %147, 0, !dbg !328
  %158 = select i1 %157, i8 %156, i8 %155, !dbg !328
    #dbg_value(i8 %158, !165, !DIExpression(), !322)
  %159 = lshr i8 %150, 1, !dbg !329
    #dbg_value(i8 %159, !166, !DIExpression(), !322)
  %160 = add nuw nsw i32 %148, 1, !dbg !330
    #dbg_value(i32 %160, !168, !DIExpression(), !324)
  %161 = icmp eq i32 %160, 8, !dbg !331
  br i1 %161, label %162, label %146, !dbg !332, !llvm.loop !333

162:                                              ; preds = %146
  %163 = xor i8 %48, %27, !dbg !335
  %164 = xor i8 %163, %138, !dbg !336
  %165 = xor i8 %164, %154, !dbg !337
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

4:                                                ; preds = %2, %4
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
  br label %44, !dbg !403

19:                                               ; preds = %44
    #dbg_value(ptr %4, !382, !DIExpression(), !385)
  %20 = getelementptr inbounds nuw i8, ptr %1, i32 160, !dbg !404
    #dbg_value(ptr %20, !383, !DIExpression(), !385)
  %21 = load i32, ptr %20, align 4, !dbg !405, !tbaa !400
  %22 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %21, i32 %75, i32 0, i32 %21) #7, !dbg !405, !srcloc !406
  store i32 %22, ptr %20, align 4, !dbg !405, !tbaa !400
  %23 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %22, i32 %76, i32 1, i32 %22) #7, !dbg !407, !srcloc !408
  store i32 %23, ptr %20, align 4, !dbg !407, !tbaa !400
  %24 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %23, i32 %77, i32 2, i32 %23) #7, !dbg !409, !srcloc !410
  store i32 %24, ptr %20, align 4, !dbg !409, !tbaa !400
  %25 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %24, i32 %74, i32 3, i32 %24) #7, !dbg !411, !srcloc !412
  store i32 %25, ptr %20, align 4, !dbg !411, !tbaa !400
  %26 = getelementptr inbounds nuw i8, ptr %1, i32 164, !dbg !413
  %27 = load i32, ptr %26, align 4, !dbg !414, !tbaa !400
  %28 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %27, i32 %76, i32 0, i32 %27) #7, !dbg !414, !srcloc !415
  store i32 %28, ptr %26, align 4, !dbg !414, !tbaa !400
  %29 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %28, i32 %77, i32 1, i32 %28) #7, !dbg !416, !srcloc !417
  store i32 %29, ptr %26, align 4, !dbg !416, !tbaa !400
  %30 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %29, i32 %74, i32 2, i32 %29) #7, !dbg !418, !srcloc !419
  store i32 %30, ptr %26, align 4, !dbg !418, !tbaa !400
  %31 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %30, i32 %75, i32 3, i32 %30) #7, !dbg !420, !srcloc !421
  store i32 %31, ptr %26, align 4, !dbg !420, !tbaa !400
  %32 = getelementptr inbounds nuw i8, ptr %1, i32 168, !dbg !422
  %33 = load i32, ptr %32, align 4, !dbg !423, !tbaa !400
  %34 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %33, i32 %77, i32 0, i32 %33) #7, !dbg !423, !srcloc !424
  store i32 %34, ptr %32, align 4, !dbg !423, !tbaa !400
  %35 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %34, i32 %74, i32 1, i32 %34) #7, !dbg !425, !srcloc !426
  store i32 %35, ptr %32, align 4, !dbg !425, !tbaa !400
  %36 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %35, i32 %75, i32 2, i32 %35) #7, !dbg !427, !srcloc !428
  store i32 %36, ptr %32, align 4, !dbg !427, !tbaa !400
  %37 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %36, i32 %76, i32 3, i32 %36) #7, !dbg !429, !srcloc !430
  store i32 %37, ptr %32, align 4, !dbg !429, !tbaa !400
  %38 = getelementptr inbounds nuw i8, ptr %1, i32 172, !dbg !431
  %39 = load i32, ptr %38, align 4, !dbg !432, !tbaa !400
  %40 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %39, i32 %74, i32 0, i32 %39) #7, !dbg !432, !srcloc !433
  store i32 %40, ptr %38, align 4, !dbg !432, !tbaa !400
  %41 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %40, i32 %75, i32 1, i32 %40) #7, !dbg !434, !srcloc !435
  store i32 %41, ptr %38, align 4, !dbg !434, !tbaa !400
  %42 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %41, i32 %76, i32 2, i32 %41) #7, !dbg !436, !srcloc !437
  store i32 %42, ptr %38, align 4, !dbg !436, !tbaa !400
  %43 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %42, i32 %77, i32 3, i32 %42) #7, !dbg !438, !srcloc !439
  store i32 %43, ptr %38, align 4, !dbg !438, !tbaa !400
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %2, ptr noundef nonnull align 4 dereferenceable(16) %20, i32 16, i1 false), !dbg !440
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #7, !dbg !441
  ret void, !dbg !441

44:                                               ; preds = %14, %44
  %45 = phi i32 [ 1, %14 ], [ %78, %44 ]
  %46 = phi i32 [ %15, %14 ], [ %75, %44 ]
    #dbg_value(i32 %45, !376, !DIExpression(), !402)
    #dbg_value(ptr %4, !378, !DIExpression(), !442)
  %47 = shl nuw nsw i32 %45, 4, !dbg !443
  %48 = getelementptr inbounds nuw i8, ptr %1, i32 %47, !dbg !444
    #dbg_value(ptr %48, !381, !DIExpression(), !442)
  %49 = load i32, ptr %48, align 4, !dbg !445, !tbaa !400
  %50 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %49, i32 %46, i32 0, i32 %49) #7, !dbg !445, !srcloc !446
  store i32 %50, ptr %48, align 4, !dbg !445, !tbaa !400
  %51 = load i32, ptr %16, align 4, !dbg !447, !tbaa !400
  %52 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %50, i32 %51, i32 1, i32 %50) #7, !dbg !448, !srcloc !449
  store i32 %52, ptr %48, align 4, !dbg !448, !tbaa !400
  %53 = load i32, ptr %17, align 4, !dbg !450, !tbaa !400
  %54 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %52, i32 %53, i32 2, i32 %52) #7, !dbg !451, !srcloc !452
  store i32 %54, ptr %48, align 4, !dbg !451, !tbaa !400
  %55 = load i32, ptr %18, align 4, !dbg !453, !tbaa !400
  %56 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %54, i32 %55, i32 3, i32 %54) #7, !dbg !454, !srcloc !455
  store i32 %56, ptr %48, align 4, !dbg !454, !tbaa !400
  %57 = getelementptr inbounds nuw i8, ptr %48, i32 4, !dbg !456
  %58 = load i32, ptr %57, align 4, !dbg !457, !tbaa !400
  %59 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %58, i32 %51, i32 0, i32 %58) #7, !dbg !457, !srcloc !458
  store i32 %59, ptr %57, align 4, !dbg !457, !tbaa !400
  %60 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %59, i32 %53, i32 1, i32 %59) #7, !dbg !459, !srcloc !460
  store i32 %60, ptr %57, align 4, !dbg !459, !tbaa !400
  %61 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %60, i32 %55, i32 2, i32 %60) #7, !dbg !461, !srcloc !462
  store i32 %61, ptr %57, align 4, !dbg !461, !tbaa !400
  %62 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %61, i32 %46, i32 3, i32 %61) #7, !dbg !463, !srcloc !464
  store i32 %62, ptr %57, align 4, !dbg !463, !tbaa !400
  %63 = getelementptr inbounds nuw i8, ptr %48, i32 8, !dbg !465
  %64 = load i32, ptr %63, align 4, !dbg !466, !tbaa !400
  %65 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %64, i32 %53, i32 0, i32 %64) #7, !dbg !466, !srcloc !467
  store i32 %65, ptr %63, align 4, !dbg !466, !tbaa !400
  %66 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %65, i32 %55, i32 1, i32 %65) #7, !dbg !468, !srcloc !469
  store i32 %66, ptr %63, align 4, !dbg !468, !tbaa !400
  %67 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %66, i32 %46, i32 2, i32 %66) #7, !dbg !470, !srcloc !471
  store i32 %67, ptr %63, align 4, !dbg !470, !tbaa !400
  %68 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %67, i32 %51, i32 3, i32 %67) #7, !dbg !472, !srcloc !473
  store i32 %68, ptr %63, align 4, !dbg !472, !tbaa !400
  %69 = getelementptr inbounds nuw i8, ptr %48, i32 12, !dbg !474
  %70 = load i32, ptr %69, align 4, !dbg !475, !tbaa !400
  %71 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %70, i32 %55, i32 0, i32 %70) #7, !dbg !475, !srcloc !476
  store i32 %71, ptr %69, align 4, !dbg !475, !tbaa !400
  %72 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %71, i32 %46, i32 1, i32 %71) #7, !dbg !477, !srcloc !478
  store i32 %72, ptr %69, align 4, !dbg !477, !tbaa !400
  %73 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %72, i32 %51, i32 2, i32 %72) #7, !dbg !479, !srcloc !480
  store i32 %73, ptr %69, align 4, !dbg !479, !tbaa !400
  %74 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %73, i32 %53, i32 3, i32 %73) #7, !dbg !481, !srcloc !482
  store i32 %74, ptr %69, align 4, !dbg !481, !tbaa !400
  %75 = load i32, ptr %48, align 4, !dbg !483, !tbaa !400
  %76 = load i32, ptr %57, align 4, !dbg !484, !tbaa !400
  store i32 %76, ptr %16, align 4, !dbg !485, !tbaa !400
  %77 = load i32, ptr %63, align 4, !dbg !486, !tbaa !400
  store i32 %77, ptr %17, align 4, !dbg !487, !tbaa !400
  store i32 %74, ptr %18, align 4, !dbg !488, !tbaa !400
  %78 = add nuw nsw i32 %45, 1, !dbg !489
    #dbg_value(i32 %78, !376, !DIExpression(), !402)
  %79 = icmp eq i32 %78, 10, !dbg !490
  br i1 %79, label %19, label %44, !dbg !403, !llvm.loop !491
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #5

; Function Attrs: nounwind optsize
define dso_local void @aes128_ecb_encrypt(ptr nocapture noundef readonly %0, i32 noundef %1, ptr nocapture noundef readonly %2, ptr nocapture noundef writeonly %3) local_unnamed_addr #4 !dbg !493 {
  %5 = alloca [176 x i8], align 1, !DIAssignID !516
    #dbg_assign(i1 undef, !505, !DIExpression(), !516, ptr %5, !DIExpression(), !517)
  %6 = alloca [176 x i8], align 1, !DIAssignID !518
    #dbg_assign(i1 undef, !509, !DIExpression(), !518, ptr %6, !DIExpression(), !517)
    #dbg_value(ptr %0, !501, !DIExpression(), !517)
    #dbg_value(i32 %1, !502, !DIExpression(), !517)
    #dbg_value(ptr %2, !503, !DIExpression(), !517)
    #dbg_value(ptr %3, !504, !DIExpression(), !517)
  %7 = and i32 %1, 15, !dbg !519
  %8 = icmp eq i32 %7, 0, !dbg !521
  br i1 %8, label %9, label %18, !dbg !521

9:                                                ; preds = %4
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %5) #7, !dbg !522
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %6) #7, !dbg !523
  call void @expand_key(ptr noundef %2, ptr noundef nonnull %5) #8, !dbg !524
    #dbg_value(i32 0, !510, !DIExpression(), !525)
  %10 = icmp eq i32 %1, 0, !dbg !526
  br i1 %10, label %17, label %11, !dbg !527

11:                                               ; preds = %9, %11
  %12 = phi i32 [ %15, %11 ], [ 0, %9 ]
    #dbg_value(i32 %12, !510, !DIExpression(), !525)
    #dbg_value(i32 0, !512, !DIExpression(), !528)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(176) %6, ptr noundef nonnull align 1 dereferenceable(176) %5, i32 176, i1 false), !dbg !529, !tbaa !60
    #dbg_value(i32 poison, !512, !DIExpression(), !528)
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 %12, !dbg !532
  %14 = getelementptr inbounds nuw i8, ptr %3, i32 %12, !dbg !533
  call void @aes128_encrypt_block(ptr noundef %13, ptr noundef nonnull %6, ptr noundef %14) #8, !dbg !534
  %15 = add i32 %12, 16, !dbg !535
    #dbg_value(i32 %15, !510, !DIExpression(), !525)
  %16 = icmp ult i32 %15, %1, !dbg !526
  br i1 %16, label %11, label %17, !dbg !527, !llvm.loop !536

17:                                               ; preds = %11, %9
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %6) #7, !dbg !538
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %5) #7, !dbg !538
  br label %18, !dbg !538

18:                                               ; preds = %4, %17
  ret void, !dbg !538
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_to_address(i32 noundef %0, i32 noundef %1) local_unnamed_addr #6 !dbg !539 {
    #dbg_value(i32 %0, !545, !DIExpression(), !547)
    #dbg_value(i32 %1, !546, !DIExpression(), !547)
  %3 = inttoptr i32 %0 to ptr, !dbg !548
  store volatile i32 %1, ptr %3, align 4, !dbg !549, !tbaa !400
  ret void, !dbg !550
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_v_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #6 !dbg !551 {
    #dbg_value(i32 %0, !555, !DIExpression(), !560)
    #dbg_value(ptr %1, !556, !DIExpression(), !560)
    #dbg_value(ptr %1, !557, !DIExpression(), !560)
    #dbg_value(i32 0, !558, !DIExpression(), !561)
  br label %4, !dbg !562

3:                                                ; preds = %4
  ret void, !dbg !563

4:                                                ; preds = %2, %4
  %5 = phi i32 [ 0, %2 ], [ %11, %4 ]
    #dbg_value(i32 %5, !558, !DIExpression(), !561)
  %6 = shl nuw nsw i32 %5, 2, !dbg !564
  %7 = add i32 %6, %0, !dbg !567
  %8 = getelementptr inbounds nuw i32, ptr %1, i32 %5, !dbg !568
  %9 = load i32, ptr %8, align 4, !dbg !568, !tbaa !400
    #dbg_value(i32 %7, !545, !DIExpression(), !569)
    #dbg_value(i32 %9, !546, !DIExpression(), !569)
  %10 = inttoptr i32 %7 to ptr, !dbg !571
  store volatile i32 %9, ptr %10, align 4, !dbg !572, !tbaa !400
  %11 = add nuw nsw i32 %5, 1, !dbg !573
    #dbg_value(i32 %11, !558, !DIExpression(), !561)
  %12 = icmp eq i32 %11, 4, !dbg !574
  br i1 %12, label %3, label %4, !dbg !562, !llvm.loop !575
}

; Function Attrs: nofree norecurse nounwind optsize
define dso_local void @write_numb_to_address(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #6 !dbg !577 {
    #dbg_value(i32 %0, !579, !DIExpression(), !582)
    #dbg_value(ptr %1, !580, !DIExpression(), !582)
    #dbg_value(ptr %1, !581, !DIExpression(), !582)
  %3 = load i32, ptr %1, align 4, !dbg !583, !tbaa !400
    #dbg_value(i32 %0, !545, !DIExpression(), !584)
    #dbg_value(i32 %3, !546, !DIExpression(), !584)
  %4 = inttoptr i32 %0 to ptr, !dbg !586
  store volatile i32 %3, ptr %4, align 4, !dbg !587, !tbaa !400
  ret void, !dbg !588
}

; Function Attrs: nounwind optsize
define dso_local noundef i32 @main() local_unnamed_addr #4 !dbg !589 {
    #dbg_assign(i1 undef, !593, !DIExpression(), !602, ptr @__const.main.plaintext, !DIExpression(), !603)
    #dbg_assign(i1 undef, !594, !DIExpression(), !604, ptr @__const.main.key, !DIExpression(), !603)
    #dbg_assign(i1 undef, !595, !DIExpression(), !605, ptr @__const.main.expected_output, !DIExpression(), !603)
  %1 = alloca [16 x i8], align 1, !DIAssignID !606
    #dbg_assign(i1 undef, !596, !DIExpression(), !606, ptr %1, !DIExpression(), !603)
    #dbg_assign(i1 undef, !593, !DIExpression(), !607, ptr @__const.main.plaintext, !DIExpression(), !603)
    #dbg_assign(i1 undef, !594, !DIExpression(), !608, ptr @__const.main.key, !DIExpression(), !603)
    #dbg_assign(i1 undef, !595, !DIExpression(), !609, ptr @__const.main.expected_output, !DIExpression(), !603)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #7, !dbg !610
    #dbg_value(i32 16, !597, !DIExpression(), !603)
  call void @aes128_ecb_encrypt(ptr noundef nonnull @__const.main.plaintext, i32 noundef 16, ptr noundef nonnull @__const.main.key, ptr noundef nonnull %1) #8, !dbg !611
    #dbg_value(i32 1056816, !598, !DIExpression(), !603)
    #dbg_value(i32 1056816, !555, !DIExpression(), !612)
    #dbg_value(ptr @__const.main.expected_output, !556, !DIExpression(), !612)
    #dbg_value(ptr @__const.main.expected_output, !557, !DIExpression(), !612)
    #dbg_value(i32 0, !558, !DIExpression(), !614)
    #dbg_value(i32 0, !558, !DIExpression(), !614)
    #dbg_value(i32 1056816, !545, !DIExpression(), !615)
    #dbg_value(i32 -73070316, !546, !DIExpression(), !615)
  store volatile i32 -73070316, ptr inttoptr (i32 1056816 to ptr), align 16, !dbg !617, !tbaa !400
    #dbg_value(i32 1, !558, !DIExpression(), !614)
    #dbg_value(i32 1056820, !545, !DIExpression(), !615)
    #dbg_value(i32 1900803103, !546, !DIExpression(), !615)
  store volatile i32 1900803103, ptr inttoptr (i32 1056820 to ptr), align 4, !dbg !617, !tbaa !400
    #dbg_value(i32 2, !558, !DIExpression(), !614)
    #dbg_value(i32 1056824, !545, !DIExpression(), !615)
    #dbg_value(i32 774220478, !546, !DIExpression(), !615)
  store volatile i32 774220478, ptr inttoptr (i32 1056824 to ptr), align 8, !dbg !617, !tbaa !400
    #dbg_value(i32 3, !558, !DIExpression(), !614)
    #dbg_value(i32 1056828, !545, !DIExpression(), !615)
    #dbg_value(i32 -1426520049, !546, !DIExpression(), !615)
  store volatile i32 -1426520049, ptr inttoptr (i32 1056828 to ptr), align 4, !dbg !617, !tbaa !400
    #dbg_value(i32 4, !558, !DIExpression(), !614)
    #dbg_value(i32 0, !558, !DIExpression(), !618)
  %2 = load i32, ptr %1, align 4, !dbg !620, !tbaa !400
    #dbg_value(i32 1056832, !545, !DIExpression(), !621)
    #dbg_value(i32 %2, !546, !DIExpression(), !621)
  store volatile i32 %2, ptr inttoptr (i32 1056832 to ptr), align 64, !dbg !623, !tbaa !400
    #dbg_value(i32 1, !558, !DIExpression(), !618)
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 4, !dbg !620
  %4 = load i32, ptr %3, align 4, !dbg !620, !tbaa !400
    #dbg_value(i32 1056836, !545, !DIExpression(), !621)
    #dbg_value(i32 %4, !546, !DIExpression(), !621)
  store volatile i32 %4, ptr inttoptr (i32 1056836 to ptr), align 4, !dbg !623, !tbaa !400
    #dbg_value(i32 2, !558, !DIExpression(), !618)
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 8, !dbg !620
  %6 = load i32, ptr %5, align 4, !dbg !620, !tbaa !400
    #dbg_value(i32 1056840, !545, !DIExpression(), !621)
    #dbg_value(i32 %6, !546, !DIExpression(), !621)
  store volatile i32 %6, ptr inttoptr (i32 1056840 to ptr), align 8, !dbg !623, !tbaa !400
    #dbg_value(i32 3, !558, !DIExpression(), !618)
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 12, !dbg !620
  %8 = load i32, ptr %7, align 4, !dbg !620, !tbaa !400
    #dbg_value(i32 1056844, !545, !DIExpression(), !621)
    #dbg_value(i32 %8, !546, !DIExpression(), !621)
  store volatile i32 %8, ptr inttoptr (i32 1056844 to ptr), align 4, !dbg !623, !tbaa !400
    #dbg_value(i32 4, !558, !DIExpression(), !618)
  br label %12, !dbg !624

9:                                                ; preds = %12
  %10 = add nuw nsw i32 %13, 1, !dbg !625
    #dbg_value(i32 %10, !600, !DIExpression(), !627)
    #dbg_value(i32 %10, !600, !DIExpression(), !627)
  %11 = icmp eq i32 %10, 16, !dbg !628
  br i1 %11, label %19, label %12, !dbg !624, !llvm.loop !629

12:                                               ; preds = %0, %9
  %13 = phi i32 [ %10, %9 ], [ 0, %0 ]
    #dbg_value(i32 %13, !600, !DIExpression(), !627)
  %14 = getelementptr inbounds nuw [16 x i8], ptr %1, i32 0, i32 %13, !dbg !631
  %15 = load i8, ptr %14, align 1, !dbg !631, !tbaa !60
  %16 = getelementptr inbounds nuw [16 x i8], ptr @__const.main.expected_output, i32 0, i32 %13, !dbg !634
  %17 = load i8, ptr %16, align 1, !dbg !634, !tbaa !60
  %18 = icmp eq i8 %15, %17, !dbg !635
    #dbg_value(i32 %13, !600, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !627)
  br i1 %18, label %9, label %19, !dbg !635

19:                                               ; preds = %12, %9
  %20 = phi i32 [ -889275714, %9 ], [ -1163220307, %12 ], !dbg !603
    #dbg_value(i32 %20, !599, !DIExpression(), !603)
    #dbg_value(i32 1056772, !545, !DIExpression(), !636)
    #dbg_value(i32 %20, !546, !DIExpression(), !636)
  store volatile i32 %20, ptr inttoptr (i32 1056772 to ptr), align 4, !dbg !638, !tbaa !400
    #dbg_value(i32 1056768, !598, !DIExpression(), !603)
    #dbg_value(i32 -559038737, !599, !DIExpression(), !603)
    #dbg_value(i32 1056768, !545, !DIExpression(), !639)
    #dbg_value(i32 -559038737, !546, !DIExpression(), !639)
  store volatile i32 -559038737, ptr inttoptr (i32 1056768 to ptr), align 8192, !dbg !641, !tbaa !400
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #7, !dbg !642
  ret i32 0, !dbg !642
}

attributes #0 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nofree norecurse nosync nounwind optsize memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zaamo,+zalrsc,+zicsr,+zkne,+zmmul,-b,-d,-e,-experimental-sdext,-experimental-sdtrig,-experimental-smctr,-experimental-ssctr,-experimental-svukte,-experimental-xqcia,-experimental-xqciac,-experimental-xqcicli,-experimental-xqcicm,-experimental-xqcics,-experimental-xqcicsr,-experimental-xqciint,-experimental-xqcilo,-experimental-xqcilsm,-experimental-xqcisls,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvkgs,-f,-h,-sha,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscmove,-xmipslsp,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zifencei,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
!70 = !DILocation(line: 42, column: 15, scope: !45)
!71 = !DILocation(line: 0, scope: !45)
!72 = !DILocation(line: 43, column: 15, scope: !45)
!73 = !DILocation(line: 44, column: 15, scope: !45)
!74 = !DILocation(line: 45, column: 15, scope: !45)
!75 = !DILocation(line: 46, column: 11, scope: !53)
!76 = !DILocation(line: 46, column: 16, scope: !53)
!77 = !DILocation(line: 0, scope: !52)
!78 = !DILocation(line: 48, column: 17, scope: !52)
!79 = !DILocation(line: 49, column: 17, scope: !52)
!80 = !DILocation(line: 50, column: 17, scope: !52)
!81 = !DILocation(line: 51, column: 17, scope: !52)
!82 = !DILocation(line: 52, column: 26, scope: !52)
!83 = !DILocation(line: 52, column: 32, scope: !52)
!84 = !DILocation(line: 52, column: 18, scope: !52)
!85 = !DILocation(line: 52, column: 15, scope: !52)
!86 = !DILocation(line: 53, column: 5, scope: !52)
!87 = !DILocation(line: 54, column: 21, scope: !45)
!88 = !DILocation(line: 54, column: 40, scope: !45)
!89 = !DILocation(line: 54, column: 19, scope: !45)
!90 = !DILocation(line: 55, column: 25, scope: !45)
!91 = !DILocation(line: 55, column: 44, scope: !45)
!92 = !DILocation(line: 55, column: 18, scope: !45)
!93 = !DILocation(line: 55, column: 5, scope: !45)
!94 = !DILocation(line: 55, column: 23, scope: !45)
!95 = !DILocation(line: 56, column: 25, scope: !45)
!96 = !DILocation(line: 56, column: 44, scope: !45)
!97 = !DILocation(line: 56, column: 18, scope: !45)
!98 = !DILocation(line: 56, column: 5, scope: !45)
!99 = !DILocation(line: 56, column: 23, scope: !45)
!100 = !DILocation(line: 57, column: 25, scope: !45)
!101 = !DILocation(line: 57, column: 44, scope: !45)
!102 = !DILocation(line: 57, column: 18, scope: !45)
!103 = !DILocation(line: 57, column: 5, scope: !45)
!104 = !DILocation(line: 57, column: 23, scope: !45)
!105 = !DILocation(line: 40, column: 27, scope: !46)
!106 = !DILocation(line: 40, column: 18, scope: !46)
!107 = !DILocation(line: 40, column: 3, scope: !47)
!108 = distinct !{!108, !107, !109, !69}
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
!176 = !DILocation(line: 101, column: 3, scope: !161)
!177 = !DILocation(line: 93, column: 11, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !3, line: 93, column: 9)
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
!214 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !211)
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
!229 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !226)
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
!251 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !248)
!252 = !DILocation(line: 0, scope: !171, inlinedAt: !248)
!253 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !248)
!254 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !248)
!255 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !248)
!256 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !248)
!257 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !248)
!258 = distinct !{!258, !250, !259, !69}
!259 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !248)
!260 = !DILocation(line: 0, scope: !161, inlinedAt: !261)
!261 = distinct !DILocation(line: 112, column: 21, scope: !198)
!262 = !DILocation(line: 0, scope: !169, inlinedAt: !261)
!263 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !261)
!264 = !DILocation(line: 0, scope: !171, inlinedAt: !261)
!265 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !261)
!266 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !261)
!267 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !261)
!268 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !261)
!269 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !261)
!270 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !261)
!271 = distinct !{!271, !270, !272, !69}
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
!282 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !279)
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
!296 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !293)
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
!313 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !310)
!314 = !DILocation(line: 0, scope: !171, inlinedAt: !310)
!315 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !310)
!316 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !310)
!317 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !310)
!318 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !310)
!319 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !310)
!320 = distinct !{!320, !312, !321, !69}
!321 = !DILocation(line: 100, column: 3, scope: !169, inlinedAt: !310)
!322 = !DILocation(line: 0, scope: !161, inlinedAt: !323)
!323 = distinct !DILocation(line: 117, column: 38, scope: !198)
!324 = !DILocation(line: 0, scope: !169, inlinedAt: !323)
!325 = !DILocation(line: 93, column: 11, scope: !178, inlinedAt: !323)
!326 = !DILocation(line: 0, scope: !171, inlinedAt: !323)
!327 = !DILocation(line: 96, column: 7, scope: !171, inlinedAt: !323)
!328 = !DILocation(line: 97, column: 9, scope: !182, inlinedAt: !323)
!329 = !DILocation(line: 99, column: 7, scope: !171, inlinedAt: !323)
!330 = !DILocation(line: 92, column: 27, scope: !172, inlinedAt: !323)
!331 = !DILocation(line: 92, column: 21, scope: !172, inlinedAt: !323)
!332 = !DILocation(line: 92, column: 3, scope: !169, inlinedAt: !323)
!333 = distinct !{!333, !332, !334, !69}
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
!404 = !DILocation(line: 231, column: 48, scope: !368)
!405 = !DILocation(line: 234, column: 3, scope: !368)
!406 = !{i64 9127}
!407 = !DILocation(line: 238, column: 3, scope: !368)
!408 = !{i64 9331}
!409 = !DILocation(line: 242, column: 3, scope: !368)
!410 = !{i64 9535}
!411 = !DILocation(line: 246, column: 3, scope: !368)
!412 = !{i64 9739}
!413 = !DILocation(line: 251, column: 27, scope: !368)
!414 = !DILocation(line: 250, column: 3, scope: !368)
!415 = !{i64 9943}
!416 = !DILocation(line: 254, column: 3, scope: !368)
!417 = !{i64 10147}
!418 = !DILocation(line: 258, column: 3, scope: !368)
!419 = !{i64 10351}
!420 = !DILocation(line: 262, column: 3, scope: !368)
!421 = !{i64 10555}
!422 = !DILocation(line: 267, column: 27, scope: !368)
!423 = !DILocation(line: 266, column: 3, scope: !368)
!424 = !{i64 10759}
!425 = !DILocation(line: 270, column: 3, scope: !368)
!426 = !{i64 10963}
!427 = !DILocation(line: 274, column: 3, scope: !368)
!428 = !{i64 11167}
!429 = !DILocation(line: 278, column: 3, scope: !368)
!430 = !{i64 11371}
!431 = !DILocation(line: 283, column: 27, scope: !368)
!432 = !DILocation(line: 282, column: 3, scope: !368)
!433 = !{i64 11575}
!434 = !DILocation(line: 286, column: 3, scope: !368)
!435 = !{i64 11779}
!436 = !DILocation(line: 290, column: 3, scope: !368)
!437 = !{i64 11983}
!438 = !DILocation(line: 294, column: 3, scope: !368)
!439 = !{i64 12187}
!440 = !DILocation(line: 299, column: 3, scope: !368)
!441 = !DILocation(line: 300, column: 1, scope: !368)
!442 = !DILocation(line: 0, scope: !379)
!443 = !DILocation(line: 169, column: 61, scope: !379)
!444 = !DILocation(line: 169, column: 44, scope: !379)
!445 = !DILocation(line: 171, column: 5, scope: !379)
!446 = !{i64 5904}
!447 = !DILocation(line: 176, column: 51, scope: !379)
!448 = !DILocation(line: 174, column: 5, scope: !379)
!449 = !{i64 6075}
!450 = !DILocation(line: 179, column: 51, scope: !379)
!451 = !DILocation(line: 177, column: 5, scope: !379)
!452 = !{i64 6246}
!453 = !DILocation(line: 182, column: 51, scope: !379)
!454 = !DILocation(line: 180, column: 5, scope: !379)
!455 = !{i64 6417}
!456 = !DILocation(line: 185, column: 29, scope: !379)
!457 = !DILocation(line: 184, column: 5, scope: !379)
!458 = !{i64 6590}
!459 = !DILocation(line: 187, column: 5, scope: !379)
!460 = !{i64 6761}
!461 = !DILocation(line: 190, column: 5, scope: !379)
!462 = !{i64 6932}
!463 = !DILocation(line: 193, column: 5, scope: !379)
!464 = !{i64 7103}
!465 = !DILocation(line: 198, column: 29, scope: !379)
!466 = !DILocation(line: 197, column: 5, scope: !379)
!467 = !{i64 7276}
!468 = !DILocation(line: 200, column: 5, scope: !379)
!469 = !{i64 7447}
!470 = !DILocation(line: 203, column: 5, scope: !379)
!471 = !{i64 7618}
!472 = !DILocation(line: 206, column: 5, scope: !379)
!473 = !{i64 7789}
!474 = !DILocation(line: 211, column: 29, scope: !379)
!475 = !DILocation(line: 210, column: 5, scope: !379)
!476 = !{i64 7962}
!477 = !DILocation(line: 213, column: 5, scope: !379)
!478 = !{i64 8133}
!479 = !DILocation(line: 216, column: 5, scope: !379)
!480 = !{i64 8304}
!481 = !DILocation(line: 219, column: 5, scope: !379)
!482 = !{i64 8475}
!483 = !DILocation(line: 223, column: 20, scope: !379)
!484 = !DILocation(line: 224, column: 20, scope: !379)
!485 = !DILocation(line: 224, column: 18, scope: !379)
!486 = !DILocation(line: 225, column: 20, scope: !379)
!487 = !DILocation(line: 225, column: 18, scope: !379)
!488 = !DILocation(line: 226, column: 18, scope: !379)
!489 = !DILocation(line: 167, column: 40, scope: !380)
!490 = !DILocation(line: 167, column: 29, scope: !380)
!491 = distinct !{!491, !403, !492, !69}
!492 = !DILocation(line: 227, column: 3, scope: !377)
!493 = distinct !DISubprogram(name: "aes128_ecb_encrypt", scope: !3, file: !3, line: 303, type: !494, scopeLine: 304, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !500)
!494 = !DISubroutineType(types: !495)
!495 = !{null, !38, !496, !38, !38}
!496 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !497, line: 40, baseType: !498)
!497 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/strings.h", directory: "", checksumkind: CSK_MD5, checksum: "dceb1b71cd72987b246237af8552faba")
!498 = !DIDerivedType(tag: DW_TAG_typedef, name: "__size_t", file: !499, line: 131, baseType: !10)
!499 = !DIFile(filename: "/opt/riscv/riscv32-unknown-elf/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "17b5691773b3e3881dfdbe392c9e8d43")
!500 = !{!501, !502, !503, !504, !505, !509, !510, !512}
!501 = !DILocalVariable(name: "plaintext", arg: 1, scope: !493, file: !3, line: 303, type: !38)
!502 = !DILocalVariable(name: "len", arg: 2, scope: !493, file: !3, line: 303, type: !496)
!503 = !DILocalVariable(name: "key", arg: 3, scope: !493, file: !3, line: 303, type: !38)
!504 = !DILocalVariable(name: "ciphertext", arg: 4, scope: !493, file: !3, line: 304, type: !38)
!505 = !DILocalVariable(name: "round_keys", scope: !493, file: !3, line: 311, type: !506)
!506 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1408, elements: !507)
!507 = !{!508}
!508 = !DISubrange(count: 176)
!509 = !DILocalVariable(name: "copy_key", scope: !493, file: !3, line: 312, type: !506)
!510 = !DILocalVariable(name: "i", scope: !511, file: !3, line: 315, type: !496)
!511 = distinct !DILexicalBlock(scope: !493, file: !3, line: 315, column: 3)
!512 = !DILocalVariable(name: "z", scope: !513, file: !3, line: 316, type: !496)
!513 = distinct !DILexicalBlock(scope: !514, file: !3, line: 316, column: 5)
!514 = distinct !DILexicalBlock(scope: !515, file: !3, line: 315, column: 40)
!515 = distinct !DILexicalBlock(scope: !511, file: !3, line: 315, column: 3)
!516 = distinct !DIAssignID()
!517 = !DILocation(line: 0, scope: !493)
!518 = distinct !DIAssignID()
!519 = !DILocation(line: 305, column: 11, scope: !520)
!520 = distinct !DILexicalBlock(scope: !493, file: !3, line: 305, column: 7)
!521 = !DILocation(line: 305, column: 16, scope: !520)
!522 = !DILocation(line: 311, column: 3, scope: !493)
!523 = !DILocation(line: 312, column: 3, scope: !493)
!524 = !DILocation(line: 313, column: 3, scope: !493)
!525 = !DILocation(line: 0, scope: !511)
!526 = !DILocation(line: 315, column: 24, scope: !515)
!527 = !DILocation(line: 315, column: 3, scope: !511)
!528 = !DILocation(line: 0, scope: !513)
!529 = !DILocation(line: 317, column: 19, scope: !530)
!530 = distinct !DILexicalBlock(scope: !531, file: !3, line: 316, column: 38)
!531 = distinct !DILexicalBlock(scope: !513, file: !3, line: 316, column: 5)
!532 = !DILocation(line: 319, column: 27, scope: !514)
!533 = !DILocation(line: 319, column: 52, scope: !514)
!534 = !DILocation(line: 319, column: 5, scope: !514)
!535 = !DILocation(line: 315, column: 33, scope: !515)
!536 = distinct !{!536, !527, !537, !69}
!537 = !DILocation(line: 320, column: 3, scope: !511)
!538 = !DILocation(line: 321, column: 1, scope: !493)
!539 = distinct !DISubprogram(name: "write_to_address", scope: !3, file: !3, line: 323, type: !540, scopeLine: 323, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !544)
!540 = !DISubroutineType(types: !541)
!541 = !{null, !542, !6}
!542 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !7, line: 82, baseType: !543)
!543 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintptr_t", file: !9, line: 232, baseType: !10)
!544 = !{!545, !546}
!545 = !DILocalVariable(name: "addr", arg: 1, scope: !539, file: !3, line: 323, type: !542)
!546 = !DILocalVariable(name: "value", arg: 2, scope: !539, file: !3, line: 323, type: !6)
!547 = !DILocation(line: 0, scope: !539)
!548 = !DILocation(line: 324, column: 4, scope: !539)
!549 = !DILocation(line: 324, column: 30, scope: !539)
!550 = !DILocation(line: 325, column: 1, scope: !539)
!551 = distinct !DISubprogram(name: "write_v_to_address", scope: !3, file: !3, line: 327, type: !552, scopeLine: 327, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !554)
!552 = !DISubroutineType(types: !553)
!553 = !{null, !542, !38}
!554 = !{!555, !556, !557, !558}
!555 = !DILocalVariable(name: "addr", arg: 1, scope: !551, file: !3, line: 327, type: !542)
!556 = !DILocalVariable(name: "vector", arg: 2, scope: !551, file: !3, line: 327, type: !38)
!557 = !DILocalVariable(name: "vector_word", scope: !551, file: !3, line: 328, type: !5)
!558 = !DILocalVariable(name: "i", scope: !559, file: !3, line: 329, type: !43)
!559 = distinct !DILexicalBlock(scope: !551, file: !3, line: 329, column: 3)
!560 = !DILocation(line: 0, scope: !551)
!561 = !DILocation(line: 0, scope: !559)
!562 = !DILocation(line: 329, column: 3, scope: !559)
!563 = !DILocation(line: 332, column: 1, scope: !551)
!564 = !DILocation(line: 330, column: 31, scope: !565)
!565 = distinct !DILexicalBlock(scope: !566, file: !3, line: 329, column: 31)
!566 = distinct !DILexicalBlock(scope: !559, file: !3, line: 329, column: 3)
!567 = !DILocation(line: 330, column: 27, scope: !565)
!568 = !DILocation(line: 330, column: 38, scope: !565)
!569 = !DILocation(line: 0, scope: !539, inlinedAt: !570)
!570 = distinct !DILocation(line: 330, column: 5, scope: !565)
!571 = !DILocation(line: 324, column: 4, scope: !539, inlinedAt: !570)
!572 = !DILocation(line: 324, column: 30, scope: !539, inlinedAt: !570)
!573 = !DILocation(line: 329, column: 27, scope: !566)
!574 = !DILocation(line: 329, column: 21, scope: !566)
!575 = distinct !{!575, !562, !576, !69}
!576 = !DILocation(line: 331, column: 3, scope: !559)
!577 = distinct !DISubprogram(name: "write_numb_to_address", scope: !3, file: !3, line: 334, type: !552, scopeLine: 334, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !578)
!578 = !{!579, !580, !581}
!579 = !DILocalVariable(name: "addr", arg: 1, scope: !577, file: !3, line: 334, type: !542)
!580 = !DILocalVariable(name: "vector", arg: 2, scope: !577, file: !3, line: 334, type: !38)
!581 = !DILocalVariable(name: "vector_word", scope: !577, file: !3, line: 335, type: !5)
!582 = !DILocation(line: 0, scope: !577)
!583 = !DILocation(line: 336, column: 26, scope: !577)
!584 = !DILocation(line: 0, scope: !539, inlinedAt: !585)
!585 = distinct !DILocation(line: 336, column: 3, scope: !577)
!586 = !DILocation(line: 324, column: 4, scope: !539, inlinedAt: !585)
!587 = !DILocation(line: 324, column: 30, scope: !539, inlinedAt: !585)
!588 = !DILocation(line: 337, column: 1, scope: !577)
!589 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 339, type: !590, scopeLine: 339, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !592)
!590 = !DISubroutineType(types: !591)
!591 = !{!43}
!592 = !{!593, !594, !595, !596, !597, !598, !599, !600}
!593 = !DILocalVariable(name: "plaintext", scope: !589, file: !3, line: 341, type: !192)
!594 = !DILocalVariable(name: "key", scope: !589, file: !3, line: 344, type: !192)
!595 = !DILocalVariable(name: "expected_output", scope: !589, file: !3, line: 346, type: !192)
!596 = !DILocalVariable(name: "ciphertext", scope: !589, file: !3, line: 349, type: !192)
!597 = !DILocalVariable(name: "len", scope: !589, file: !3, line: 350, type: !496)
!598 = !DILocalVariable(name: "addr", scope: !589, file: !3, line: 352, type: !542)
!599 = !DILocalVariable(name: "value", scope: !589, file: !3, line: 353, type: !6)
!600 = !DILocalVariable(name: "i", scope: !601, file: !3, line: 383, type: !43)
!601 = distinct !DILexicalBlock(scope: !589, file: !3, line: 383, column: 3)
!602 = distinct !DIAssignID()
!603 = !DILocation(line: 0, scope: !589)
!604 = distinct !DIAssignID()
!605 = distinct !DIAssignID()
!606 = distinct !DIAssignID()
!607 = distinct !DIAssignID()
!608 = distinct !DIAssignID()
!609 = distinct !DIAssignID()
!610 = !DILocation(line: 349, column: 3, scope: !589)
!611 = !DILocation(line: 355, column: 3, scope: !589)
!612 = !DILocation(line: 0, scope: !551, inlinedAt: !613)
!613 = distinct !DILocation(line: 358, column: 3, scope: !589)
!614 = !DILocation(line: 0, scope: !559, inlinedAt: !613)
!615 = !DILocation(line: 0, scope: !539, inlinedAt: !616)
!616 = distinct !DILocation(line: 330, column: 5, scope: !565, inlinedAt: !613)
!617 = !DILocation(line: 324, column: 30, scope: !539, inlinedAt: !616)
!618 = !DILocation(line: 0, scope: !559, inlinedAt: !619)
!619 = distinct !DILocation(line: 361, column: 3, scope: !589)
!620 = !DILocation(line: 330, column: 38, scope: !565, inlinedAt: !619)
!621 = !DILocation(line: 0, scope: !539, inlinedAt: !622)
!622 = distinct !DILocation(line: 330, column: 5, scope: !565, inlinedAt: !619)
!623 = !DILocation(line: 324, column: 30, scope: !539, inlinedAt: !622)
!624 = !DILocation(line: 383, column: 3, scope: !601)
!625 = !DILocation(line: 383, column: 28, scope: !626)
!626 = distinct !DILexicalBlock(scope: !601, file: !3, line: 383, column: 3)
!627 = !DILocation(line: 0, scope: !601)
!628 = !DILocation(line: 383, column: 21, scope: !626)
!629 = distinct !{!629, !624, !630, !69}
!630 = !DILocation(line: 388, column: 3, scope: !601)
!631 = !DILocation(line: 384, column: 9, scope: !632)
!632 = distinct !DILexicalBlock(scope: !633, file: !3, line: 384, column: 9)
!633 = distinct !DILexicalBlock(scope: !626, file: !3, line: 383, column: 32)
!634 = !DILocation(line: 384, column: 26, scope: !632)
!635 = !DILocation(line: 384, column: 23, scope: !632)
!636 = !DILocation(line: 0, scope: !539, inlinedAt: !637)
!637 = distinct !DILocation(line: 389, column: 3, scope: !589)
!638 = !DILocation(line: 324, column: 30, scope: !539, inlinedAt: !637)
!639 = !DILocation(line: 0, scope: !539, inlinedAt: !640)
!640 = distinct !DILocation(line: 395, column: 3, scope: !589)
!641 = !DILocation(line: 324, column: 30, scope: !539, inlinedAt: !640)
!642 = !DILocation(line: 398, column: 1, scope: !589)

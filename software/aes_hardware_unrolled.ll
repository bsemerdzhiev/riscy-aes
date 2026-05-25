; ModuleID = '../aes_hardware.ll'
source_filename = "aes_hardware.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx14.2.0"

@sbox = internal unnamed_addr constant [256 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB\E02:\0AI\06$\\\C2\D3\ACb\91\95\E4y\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8Ap>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16", align 1
@rcon = internal unnamed_addr constant [10 x i8] c"\01\02\04\08\10 @\80\1B6", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"%02x \00", align 1
@__const.main.plaintext = private unnamed_addr constant [16 x i8] c"Hello, World!000", align 1
@__const.main.key = private unnamed_addr constant [16 x i8] c"cese4085password", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Plaintext\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"Key\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"Ciphertext\00", align 1
@str = private unnamed_addr constant [65 x i8] c"Error: Input length must be a multiple of 16 bytes (no padding).\00", align 1

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @expand_key(ptr nocapture noundef readonly %0, ptr nocapture noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i64 [ 0, %2 ], [ %8, %3 ]
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 %4
  %6 = load i8, ptr %5, align 1, !tbaa !6
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 %4
  store i8 %6, ptr %7, align 1, !tbaa !6
  %8 = add nuw nsw i64 %4, 1
  %9 = icmp eq i64 %8, 16
  br i1 %9, label %.preheader, label %3, !llvm.loop !9

.preheader:                                       ; preds = %3
  br label %10

10:                                               ; preds = %.preheader, %43
  %11 = phi i64 [ %66, %43 ], [ 16, %.preheader ]
  %12 = getelementptr i8, ptr %1, i64 %11
  %13 = getelementptr i8, ptr %12, i64 -4
  %14 = load i8, ptr %13, align 1, !tbaa !6
  %15 = getelementptr i8, ptr %12, i64 -3
  %16 = load i8, ptr %15, align 1, !tbaa !6
  %17 = getelementptr i8, ptr %12, i64 -2
  %18 = load i8, ptr %17, align 1, !tbaa !6
  %19 = getelementptr i8, ptr %12, i64 -1
  %20 = load i8, ptr %19, align 1, !tbaa !6
  %21 = and i64 %11, 12
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %43

23:                                               ; preds = %10
  %24 = zext i8 %16 to i64
  %25 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %24
  %26 = load i8, ptr %25, align 1, !tbaa !6
  %27 = zext i8 %18 to i64
  %28 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %27
  %29 = load i8, ptr %28, align 1, !tbaa !6
  %30 = zext i8 %20 to i64
  %31 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %30
  %32 = load i8, ptr %31, align 1, !tbaa !6
  %33 = zext i8 %14 to i64
  %34 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %33
  %35 = load i8, ptr %34, align 1, !tbaa !6
  %36 = trunc nuw nsw i64 %11 to i32
  %37 = lshr exact i32 %36, 4
  %38 = add nsw i32 %37, -1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [10 x i8], ptr @rcon, i64 0, i64 %39
  %41 = load i8, ptr %40, align 1, !tbaa !6
  %42 = xor i8 %41, %26
  br label %43

43:                                               ; preds = %23, %10
  %44 = phi i8 [ %35, %23 ], [ %20, %10 ]
  %45 = phi i8 [ %32, %23 ], [ %18, %10 ]
  %46 = phi i8 [ %29, %23 ], [ %16, %10 ]
  %47 = phi i8 [ %42, %23 ], [ %14, %10 ]
  %48 = getelementptr i8, ptr %12, i64 -16
  %49 = load i8, ptr %48, align 1, !tbaa !6
  %50 = xor i8 %49, %47
  store i8 %50, ptr %12, align 1, !tbaa !6
  %51 = getelementptr i8, ptr %12, i64 -15
  %52 = load i8, ptr %51, align 1, !tbaa !6
  %53 = xor i8 %52, %46
  %54 = or disjoint i64 %11, 1
  %55 = getelementptr inbounds nuw i8, ptr %1, i64 %54
  store i8 %53, ptr %55, align 1, !tbaa !6
  %56 = getelementptr i8, ptr %12, i64 -14
  %57 = load i8, ptr %56, align 1, !tbaa !6
  %58 = xor i8 %57, %45
  %59 = or disjoint i64 %11, 2
  %60 = getelementptr inbounds nuw i8, ptr %1, i64 %59
  store i8 %58, ptr %60, align 1, !tbaa !6
  %61 = getelementptr i8, ptr %12, i64 -13
  %62 = load i8, ptr %61, align 1, !tbaa !6
  %63 = xor i8 %62, %44
  %64 = or disjoint i64 %11, 3
  %65 = getelementptr inbounds nuw i8, ptr %1, i64 %64
  store i8 %63, ptr %65, align 1, !tbaa !6
  %66 = add nuw nsw i64 %11, 4
  %67 = icmp samesign ult i64 %11, 172
  br i1 %67, label %10, label %68, !llvm.loop !12

68:                                               ; preds = %43
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @add_round_key(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  br label %4

3:                                                ; preds = %4
  ret void

4:                                                ; preds = %4, %2
  %5 = phi i64 [ 0, %2 ], [ %11, %4 ]
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 %5
  %7 = load i8, ptr %6, align 1, !tbaa !6
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 %5
  %9 = load i8, ptr %8, align 1, !tbaa !6
  %10 = xor i8 %9, %7
  store i8 %10, ptr %8, align 1, !tbaa !6
  %11 = add nuw nsw i64 %5, 1
  %12 = icmp eq i64 %11, 16
  br i1 %12, label %3, label %4, !llvm.loop !13
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @aes128_encrypt_block(ptr nocapture noundef readonly %0, ptr nocapture noundef %1, ptr noundef %2) local_unnamed_addr #2 {
  %4 = alloca [16 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #7
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %4, ptr noundef nonnull align 1 dereferenceable(16) %0, i64 16, i1 false)
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i64 [ 0, %3 ], [ %12, %5 ]
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 %6
  %8 = load i8, ptr %7, align 1, !tbaa !6
  %9 = getelementptr inbounds nuw i8, ptr %4, i64 %6
  %10 = load i8, ptr %9, align 1, !tbaa !6
  %11 = xor i8 %10, %8
  store i8 %11, ptr %9, align 1, !tbaa !6
  %12 = add nuw nsw i64 %6, 1
  %13 = icmp eq i64 %12, 16
  br i1 %13, label %14, label %5, !llvm.loop !13

14:                                               ; preds = %5
  %15 = load i32, ptr %4, align 4, !tbaa !14
  %16 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %17 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %18 = getelementptr inbounds nuw i8, ptr %4, i64 12
  br label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %21 = load i32, ptr %20, align 4, !tbaa !14
  %22 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %21, i32 %15, i32 0, i32 %21) #7, !srcloc !16
  store i32 %22, ptr %20, align 4, !tbaa !14
  %23 = load i32, ptr %16, align 4, !tbaa !14
  %24 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %22, i32 %23, i32 1, i32 %22) #7, !srcloc !17
  store i32 %24, ptr %20, align 4, !tbaa !14
  %25 = load i32, ptr %17, align 4, !tbaa !14
  %26 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %24, i32 %25, i32 2, i32 %24) #7, !srcloc !18
  store i32 %26, ptr %20, align 4, !tbaa !14
  %27 = load i32, ptr %18, align 4, !tbaa !14
  %28 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %26, i32 %27, i32 3, i32 %26) #7, !srcloc !19
  store i32 %28, ptr %20, align 4, !tbaa !14
  %29 = getelementptr inbounds nuw i8, ptr %20, i64 4
  %30 = load i32, ptr %29, align 4, !tbaa !14
  %31 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %30, i32 %23, i32 0, i32 %30) #7, !srcloc !20
  store i32 %31, ptr %29, align 4, !tbaa !14
  %32 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %31, i32 %25, i32 1, i32 %31) #7, !srcloc !21
  store i32 %32, ptr %29, align 4, !tbaa !14
  %33 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %32, i32 %27, i32 2, i32 %32) #7, !srcloc !22
  store i32 %33, ptr %29, align 4, !tbaa !14
  %34 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %33, i32 %15, i32 3, i32 %33) #7, !srcloc !23
  store i32 %34, ptr %29, align 4, !tbaa !14
  %35 = getelementptr inbounds nuw i8, ptr %20, i64 8
  %36 = load i32, ptr %35, align 4, !tbaa !14
  %37 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %36, i32 %25, i32 0, i32 %36) #7, !srcloc !24
  store i32 %37, ptr %35, align 4, !tbaa !14
  %38 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %37, i32 %27, i32 1, i32 %37) #7, !srcloc !25
  store i32 %38, ptr %35, align 4, !tbaa !14
  %39 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %38, i32 %15, i32 2, i32 %38) #7, !srcloc !26
  store i32 %39, ptr %35, align 4, !tbaa !14
  %40 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %39, i32 %23, i32 3, i32 %39) #7, !srcloc !27
  store i32 %40, ptr %35, align 4, !tbaa !14
  %41 = getelementptr inbounds nuw i8, ptr %20, i64 12
  %42 = load i32, ptr %41, align 4, !tbaa !14
  %43 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %42, i32 %27, i32 0, i32 %42) #7, !srcloc !28
  store i32 %43, ptr %41, align 4, !tbaa !14
  %44 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %43, i32 %15, i32 1, i32 %43) #7, !srcloc !29
  store i32 %44, ptr %41, align 4, !tbaa !14
  %45 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %44, i32 %23, i32 2, i32 %44) #7, !srcloc !30
  store i32 %45, ptr %41, align 4, !tbaa !14
  %46 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %45, i32 %25, i32 3, i32 %45) #7, !srcloc !31
  store i32 %46, ptr %41, align 4, !tbaa !14
  %47 = load i32, ptr %20, align 4, !tbaa !14
  %48 = load i32, ptr %29, align 4, !tbaa !14
  store i32 %48, ptr %16, align 4, !tbaa !14
  %49 = load i32, ptr %35, align 4, !tbaa !14
  store i32 %49, ptr %17, align 4, !tbaa !14
  store i32 %46, ptr %18, align 4, !tbaa !14
  %50 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %51 = load i32, ptr %50, align 4, !tbaa !14
  %52 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %51, i32 %47, i32 0, i32 %51) #7, !srcloc !16
  store i32 %52, ptr %50, align 4, !tbaa !14
  %53 = load i32, ptr %16, align 4, !tbaa !14
  %54 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %52, i32 %53, i32 1, i32 %52) #7, !srcloc !17
  store i32 %54, ptr %50, align 4, !tbaa !14
  %55 = load i32, ptr %17, align 4, !tbaa !14
  %56 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %54, i32 %55, i32 2, i32 %54) #7, !srcloc !18
  store i32 %56, ptr %50, align 4, !tbaa !14
  %57 = load i32, ptr %18, align 4, !tbaa !14
  %58 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %56, i32 %57, i32 3, i32 %56) #7, !srcloc !19
  store i32 %58, ptr %50, align 4, !tbaa !14
  %59 = getelementptr inbounds nuw i8, ptr %50, i64 4
  %60 = load i32, ptr %59, align 4, !tbaa !14
  %61 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %60, i32 %53, i32 0, i32 %60) #7, !srcloc !20
  store i32 %61, ptr %59, align 4, !tbaa !14
  %62 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %61, i32 %55, i32 1, i32 %61) #7, !srcloc !21
  store i32 %62, ptr %59, align 4, !tbaa !14
  %63 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %62, i32 %57, i32 2, i32 %62) #7, !srcloc !22
  store i32 %63, ptr %59, align 4, !tbaa !14
  %64 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %63, i32 %47, i32 3, i32 %63) #7, !srcloc !23
  store i32 %64, ptr %59, align 4, !tbaa !14
  %65 = getelementptr inbounds nuw i8, ptr %50, i64 8
  %66 = load i32, ptr %65, align 4, !tbaa !14
  %67 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %66, i32 %55, i32 0, i32 %66) #7, !srcloc !24
  store i32 %67, ptr %65, align 4, !tbaa !14
  %68 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %67, i32 %57, i32 1, i32 %67) #7, !srcloc !25
  store i32 %68, ptr %65, align 4, !tbaa !14
  %69 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %68, i32 %47, i32 2, i32 %68) #7, !srcloc !26
  store i32 %69, ptr %65, align 4, !tbaa !14
  %70 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %69, i32 %53, i32 3, i32 %69) #7, !srcloc !27
  store i32 %70, ptr %65, align 4, !tbaa !14
  %71 = getelementptr inbounds nuw i8, ptr %50, i64 12
  %72 = load i32, ptr %71, align 4, !tbaa !14
  %73 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %72, i32 %57, i32 0, i32 %72) #7, !srcloc !28
  store i32 %73, ptr %71, align 4, !tbaa !14
  %74 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %73, i32 %47, i32 1, i32 %73) #7, !srcloc !29
  store i32 %74, ptr %71, align 4, !tbaa !14
  %75 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %74, i32 %53, i32 2, i32 %74) #7, !srcloc !30
  store i32 %75, ptr %71, align 4, !tbaa !14
  %76 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %75, i32 %55, i32 3, i32 %75) #7, !srcloc !31
  store i32 %76, ptr %71, align 4, !tbaa !14
  %77 = load i32, ptr %50, align 4, !tbaa !14
  %78 = load i32, ptr %59, align 4, !tbaa !14
  store i32 %78, ptr %16, align 4, !tbaa !14
  %79 = load i32, ptr %65, align 4, !tbaa !14
  store i32 %79, ptr %17, align 4, !tbaa !14
  store i32 %76, ptr %18, align 4, !tbaa !14
  %80 = getelementptr inbounds nuw i8, ptr %1, i64 48
  %81 = load i32, ptr %80, align 4, !tbaa !14
  %82 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %81, i32 %77, i32 0, i32 %81) #7, !srcloc !16
  store i32 %82, ptr %80, align 4, !tbaa !14
  %83 = load i32, ptr %16, align 4, !tbaa !14
  %84 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %82, i32 %83, i32 1, i32 %82) #7, !srcloc !17
  store i32 %84, ptr %80, align 4, !tbaa !14
  %85 = load i32, ptr %17, align 4, !tbaa !14
  %86 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %84, i32 %85, i32 2, i32 %84) #7, !srcloc !18
  store i32 %86, ptr %80, align 4, !tbaa !14
  %87 = load i32, ptr %18, align 4, !tbaa !14
  %88 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %86, i32 %87, i32 3, i32 %86) #7, !srcloc !19
  store i32 %88, ptr %80, align 4, !tbaa !14
  %89 = getelementptr inbounds nuw i8, ptr %80, i64 4
  %90 = load i32, ptr %89, align 4, !tbaa !14
  %91 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %90, i32 %83, i32 0, i32 %90) #7, !srcloc !20
  store i32 %91, ptr %89, align 4, !tbaa !14
  %92 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %91, i32 %85, i32 1, i32 %91) #7, !srcloc !21
  store i32 %92, ptr %89, align 4, !tbaa !14
  %93 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %92, i32 %87, i32 2, i32 %92) #7, !srcloc !22
  store i32 %93, ptr %89, align 4, !tbaa !14
  %94 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %93, i32 %77, i32 3, i32 %93) #7, !srcloc !23
  store i32 %94, ptr %89, align 4, !tbaa !14
  %95 = getelementptr inbounds nuw i8, ptr %80, i64 8
  %96 = load i32, ptr %95, align 4, !tbaa !14
  %97 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %96, i32 %85, i32 0, i32 %96) #7, !srcloc !24
  store i32 %97, ptr %95, align 4, !tbaa !14
  %98 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %97, i32 %87, i32 1, i32 %97) #7, !srcloc !25
  store i32 %98, ptr %95, align 4, !tbaa !14
  %99 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %98, i32 %77, i32 2, i32 %98) #7, !srcloc !26
  store i32 %99, ptr %95, align 4, !tbaa !14
  %100 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %99, i32 %83, i32 3, i32 %99) #7, !srcloc !27
  store i32 %100, ptr %95, align 4, !tbaa !14
  %101 = getelementptr inbounds nuw i8, ptr %80, i64 12
  %102 = load i32, ptr %101, align 4, !tbaa !14
  %103 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %102, i32 %87, i32 0, i32 %102) #7, !srcloc !28
  store i32 %103, ptr %101, align 4, !tbaa !14
  %104 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %103, i32 %77, i32 1, i32 %103) #7, !srcloc !29
  store i32 %104, ptr %101, align 4, !tbaa !14
  %105 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %104, i32 %83, i32 2, i32 %104) #7, !srcloc !30
  store i32 %105, ptr %101, align 4, !tbaa !14
  %106 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %105, i32 %85, i32 3, i32 %105) #7, !srcloc !31
  store i32 %106, ptr %101, align 4, !tbaa !14
  %107 = load i32, ptr %80, align 4, !tbaa !14
  %108 = load i32, ptr %89, align 4, !tbaa !14
  store i32 %108, ptr %16, align 4, !tbaa !14
  %109 = load i32, ptr %95, align 4, !tbaa !14
  store i32 %109, ptr %17, align 4, !tbaa !14
  store i32 %106, ptr %18, align 4, !tbaa !14
  %110 = getelementptr inbounds nuw i8, ptr %1, i64 64
  %111 = load i32, ptr %110, align 4, !tbaa !14
  %112 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %111, i32 %107, i32 0, i32 %111) #7, !srcloc !16
  store i32 %112, ptr %110, align 4, !tbaa !14
  %113 = load i32, ptr %16, align 4, !tbaa !14
  %114 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %112, i32 %113, i32 1, i32 %112) #7, !srcloc !17
  store i32 %114, ptr %110, align 4, !tbaa !14
  %115 = load i32, ptr %17, align 4, !tbaa !14
  %116 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %114, i32 %115, i32 2, i32 %114) #7, !srcloc !18
  store i32 %116, ptr %110, align 4, !tbaa !14
  %117 = load i32, ptr %18, align 4, !tbaa !14
  %118 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %116, i32 %117, i32 3, i32 %116) #7, !srcloc !19
  store i32 %118, ptr %110, align 4, !tbaa !14
  %119 = getelementptr inbounds nuw i8, ptr %110, i64 4
  %120 = load i32, ptr %119, align 4, !tbaa !14
  %121 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %120, i32 %113, i32 0, i32 %120) #7, !srcloc !20
  store i32 %121, ptr %119, align 4, !tbaa !14
  %122 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %121, i32 %115, i32 1, i32 %121) #7, !srcloc !21
  store i32 %122, ptr %119, align 4, !tbaa !14
  %123 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %122, i32 %117, i32 2, i32 %122) #7, !srcloc !22
  store i32 %123, ptr %119, align 4, !tbaa !14
  %124 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %123, i32 %107, i32 3, i32 %123) #7, !srcloc !23
  store i32 %124, ptr %119, align 4, !tbaa !14
  %125 = getelementptr inbounds nuw i8, ptr %110, i64 8
  %126 = load i32, ptr %125, align 4, !tbaa !14
  %127 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %126, i32 %115, i32 0, i32 %126) #7, !srcloc !24
  store i32 %127, ptr %125, align 4, !tbaa !14
  %128 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %127, i32 %117, i32 1, i32 %127) #7, !srcloc !25
  store i32 %128, ptr %125, align 4, !tbaa !14
  %129 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %128, i32 %107, i32 2, i32 %128) #7, !srcloc !26
  store i32 %129, ptr %125, align 4, !tbaa !14
  %130 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %129, i32 %113, i32 3, i32 %129) #7, !srcloc !27
  store i32 %130, ptr %125, align 4, !tbaa !14
  %131 = getelementptr inbounds nuw i8, ptr %110, i64 12
  %132 = load i32, ptr %131, align 4, !tbaa !14
  %133 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %132, i32 %117, i32 0, i32 %132) #7, !srcloc !28
  store i32 %133, ptr %131, align 4, !tbaa !14
  %134 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %133, i32 %107, i32 1, i32 %133) #7, !srcloc !29
  store i32 %134, ptr %131, align 4, !tbaa !14
  %135 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %134, i32 %113, i32 2, i32 %134) #7, !srcloc !30
  store i32 %135, ptr %131, align 4, !tbaa !14
  %136 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %135, i32 %115, i32 3, i32 %135) #7, !srcloc !31
  store i32 %136, ptr %131, align 4, !tbaa !14
  %137 = load i32, ptr %110, align 4, !tbaa !14
  %138 = load i32, ptr %119, align 4, !tbaa !14
  store i32 %138, ptr %16, align 4, !tbaa !14
  %139 = load i32, ptr %125, align 4, !tbaa !14
  store i32 %139, ptr %17, align 4, !tbaa !14
  store i32 %136, ptr %18, align 4, !tbaa !14
  %140 = getelementptr inbounds nuw i8, ptr %1, i64 80
  %141 = load i32, ptr %140, align 4, !tbaa !14
  %142 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %141, i32 %137, i32 0, i32 %141) #7, !srcloc !16
  store i32 %142, ptr %140, align 4, !tbaa !14
  %143 = load i32, ptr %16, align 4, !tbaa !14
  %144 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %142, i32 %143, i32 1, i32 %142) #7, !srcloc !17
  store i32 %144, ptr %140, align 4, !tbaa !14
  %145 = load i32, ptr %17, align 4, !tbaa !14
  %146 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %144, i32 %145, i32 2, i32 %144) #7, !srcloc !18
  store i32 %146, ptr %140, align 4, !tbaa !14
  %147 = load i32, ptr %18, align 4, !tbaa !14
  %148 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %146, i32 %147, i32 3, i32 %146) #7, !srcloc !19
  store i32 %148, ptr %140, align 4, !tbaa !14
  %149 = getelementptr inbounds nuw i8, ptr %140, i64 4
  %150 = load i32, ptr %149, align 4, !tbaa !14
  %151 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %150, i32 %143, i32 0, i32 %150) #7, !srcloc !20
  store i32 %151, ptr %149, align 4, !tbaa !14
  %152 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %151, i32 %145, i32 1, i32 %151) #7, !srcloc !21
  store i32 %152, ptr %149, align 4, !tbaa !14
  %153 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %152, i32 %147, i32 2, i32 %152) #7, !srcloc !22
  store i32 %153, ptr %149, align 4, !tbaa !14
  %154 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %153, i32 %137, i32 3, i32 %153) #7, !srcloc !23
  store i32 %154, ptr %149, align 4, !tbaa !14
  %155 = getelementptr inbounds nuw i8, ptr %140, i64 8
  %156 = load i32, ptr %155, align 4, !tbaa !14
  %157 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %156, i32 %145, i32 0, i32 %156) #7, !srcloc !24
  store i32 %157, ptr %155, align 4, !tbaa !14
  %158 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %157, i32 %147, i32 1, i32 %157) #7, !srcloc !25
  store i32 %158, ptr %155, align 4, !tbaa !14
  %159 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %158, i32 %137, i32 2, i32 %158) #7, !srcloc !26
  store i32 %159, ptr %155, align 4, !tbaa !14
  %160 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %159, i32 %143, i32 3, i32 %159) #7, !srcloc !27
  store i32 %160, ptr %155, align 4, !tbaa !14
  %161 = getelementptr inbounds nuw i8, ptr %140, i64 12
  %162 = load i32, ptr %161, align 4, !tbaa !14
  %163 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %162, i32 %147, i32 0, i32 %162) #7, !srcloc !28
  store i32 %163, ptr %161, align 4, !tbaa !14
  %164 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %163, i32 %137, i32 1, i32 %163) #7, !srcloc !29
  store i32 %164, ptr %161, align 4, !tbaa !14
  %165 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %164, i32 %143, i32 2, i32 %164) #7, !srcloc !30
  store i32 %165, ptr %161, align 4, !tbaa !14
  %166 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %165, i32 %145, i32 3, i32 %165) #7, !srcloc !31
  store i32 %166, ptr %161, align 4, !tbaa !14
  %167 = load i32, ptr %140, align 4, !tbaa !14
  %168 = load i32, ptr %149, align 4, !tbaa !14
  store i32 %168, ptr %16, align 4, !tbaa !14
  %169 = load i32, ptr %155, align 4, !tbaa !14
  store i32 %169, ptr %17, align 4, !tbaa !14
  store i32 %166, ptr %18, align 4, !tbaa !14
  %170 = getelementptr inbounds nuw i8, ptr %1, i64 96
  %171 = load i32, ptr %170, align 4, !tbaa !14
  %172 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %171, i32 %167, i32 0, i32 %171) #7, !srcloc !16
  store i32 %172, ptr %170, align 4, !tbaa !14
  %173 = load i32, ptr %16, align 4, !tbaa !14
  %174 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %172, i32 %173, i32 1, i32 %172) #7, !srcloc !17
  store i32 %174, ptr %170, align 4, !tbaa !14
  %175 = load i32, ptr %17, align 4, !tbaa !14
  %176 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %174, i32 %175, i32 2, i32 %174) #7, !srcloc !18
  store i32 %176, ptr %170, align 4, !tbaa !14
  %177 = load i32, ptr %18, align 4, !tbaa !14
  %178 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %176, i32 %177, i32 3, i32 %176) #7, !srcloc !19
  store i32 %178, ptr %170, align 4, !tbaa !14
  %179 = getelementptr inbounds nuw i8, ptr %170, i64 4
  %180 = load i32, ptr %179, align 4, !tbaa !14
  %181 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %180, i32 %173, i32 0, i32 %180) #7, !srcloc !20
  store i32 %181, ptr %179, align 4, !tbaa !14
  %182 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %181, i32 %175, i32 1, i32 %181) #7, !srcloc !21
  store i32 %182, ptr %179, align 4, !tbaa !14
  %183 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %182, i32 %177, i32 2, i32 %182) #7, !srcloc !22
  store i32 %183, ptr %179, align 4, !tbaa !14
  %184 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %183, i32 %167, i32 3, i32 %183) #7, !srcloc !23
  store i32 %184, ptr %179, align 4, !tbaa !14
  %185 = getelementptr inbounds nuw i8, ptr %170, i64 8
  %186 = load i32, ptr %185, align 4, !tbaa !14
  %187 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %186, i32 %175, i32 0, i32 %186) #7, !srcloc !24
  store i32 %187, ptr %185, align 4, !tbaa !14
  %188 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %187, i32 %177, i32 1, i32 %187) #7, !srcloc !25
  store i32 %188, ptr %185, align 4, !tbaa !14
  %189 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %188, i32 %167, i32 2, i32 %188) #7, !srcloc !26
  store i32 %189, ptr %185, align 4, !tbaa !14
  %190 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %189, i32 %173, i32 3, i32 %189) #7, !srcloc !27
  store i32 %190, ptr %185, align 4, !tbaa !14
  %191 = getelementptr inbounds nuw i8, ptr %170, i64 12
  %192 = load i32, ptr %191, align 4, !tbaa !14
  %193 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %192, i32 %177, i32 0, i32 %192) #7, !srcloc !28
  store i32 %193, ptr %191, align 4, !tbaa !14
  %194 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %193, i32 %167, i32 1, i32 %193) #7, !srcloc !29
  store i32 %194, ptr %191, align 4, !tbaa !14
  %195 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %194, i32 %173, i32 2, i32 %194) #7, !srcloc !30
  store i32 %195, ptr %191, align 4, !tbaa !14
  %196 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %195, i32 %175, i32 3, i32 %195) #7, !srcloc !31
  store i32 %196, ptr %191, align 4, !tbaa !14
  %197 = load i32, ptr %170, align 4, !tbaa !14
  %198 = load i32, ptr %179, align 4, !tbaa !14
  store i32 %198, ptr %16, align 4, !tbaa !14
  %199 = load i32, ptr %185, align 4, !tbaa !14
  store i32 %199, ptr %17, align 4, !tbaa !14
  store i32 %196, ptr %18, align 4, !tbaa !14
  %200 = getelementptr inbounds nuw i8, ptr %1, i64 112
  %201 = load i32, ptr %200, align 4, !tbaa !14
  %202 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %201, i32 %197, i32 0, i32 %201) #7, !srcloc !16
  store i32 %202, ptr %200, align 4, !tbaa !14
  %203 = load i32, ptr %16, align 4, !tbaa !14
  %204 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %202, i32 %203, i32 1, i32 %202) #7, !srcloc !17
  store i32 %204, ptr %200, align 4, !tbaa !14
  %205 = load i32, ptr %17, align 4, !tbaa !14
  %206 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %204, i32 %205, i32 2, i32 %204) #7, !srcloc !18
  store i32 %206, ptr %200, align 4, !tbaa !14
  %207 = load i32, ptr %18, align 4, !tbaa !14
  %208 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %206, i32 %207, i32 3, i32 %206) #7, !srcloc !19
  store i32 %208, ptr %200, align 4, !tbaa !14
  %209 = getelementptr inbounds nuw i8, ptr %200, i64 4
  %210 = load i32, ptr %209, align 4, !tbaa !14
  %211 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %210, i32 %203, i32 0, i32 %210) #7, !srcloc !20
  store i32 %211, ptr %209, align 4, !tbaa !14
  %212 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %211, i32 %205, i32 1, i32 %211) #7, !srcloc !21
  store i32 %212, ptr %209, align 4, !tbaa !14
  %213 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %212, i32 %207, i32 2, i32 %212) #7, !srcloc !22
  store i32 %213, ptr %209, align 4, !tbaa !14
  %214 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %213, i32 %197, i32 3, i32 %213) #7, !srcloc !23
  store i32 %214, ptr %209, align 4, !tbaa !14
  %215 = getelementptr inbounds nuw i8, ptr %200, i64 8
  %216 = load i32, ptr %215, align 4, !tbaa !14
  %217 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %216, i32 %205, i32 0, i32 %216) #7, !srcloc !24
  store i32 %217, ptr %215, align 4, !tbaa !14
  %218 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %217, i32 %207, i32 1, i32 %217) #7, !srcloc !25
  store i32 %218, ptr %215, align 4, !tbaa !14
  %219 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %218, i32 %197, i32 2, i32 %218) #7, !srcloc !26
  store i32 %219, ptr %215, align 4, !tbaa !14
  %220 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %219, i32 %203, i32 3, i32 %219) #7, !srcloc !27
  store i32 %220, ptr %215, align 4, !tbaa !14
  %221 = getelementptr inbounds nuw i8, ptr %200, i64 12
  %222 = load i32, ptr %221, align 4, !tbaa !14
  %223 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %222, i32 %207, i32 0, i32 %222) #7, !srcloc !28
  store i32 %223, ptr %221, align 4, !tbaa !14
  %224 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %223, i32 %197, i32 1, i32 %223) #7, !srcloc !29
  store i32 %224, ptr %221, align 4, !tbaa !14
  %225 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %224, i32 %203, i32 2, i32 %224) #7, !srcloc !30
  store i32 %225, ptr %221, align 4, !tbaa !14
  %226 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %225, i32 %205, i32 3, i32 %225) #7, !srcloc !31
  store i32 %226, ptr %221, align 4, !tbaa !14
  %227 = load i32, ptr %200, align 4, !tbaa !14
  %228 = load i32, ptr %209, align 4, !tbaa !14
  store i32 %228, ptr %16, align 4, !tbaa !14
  %229 = load i32, ptr %215, align 4, !tbaa !14
  store i32 %229, ptr %17, align 4, !tbaa !14
  store i32 %226, ptr %18, align 4, !tbaa !14
  %230 = getelementptr inbounds nuw i8, ptr %1, i64 128
  %231 = load i32, ptr %230, align 4, !tbaa !14
  %232 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %231, i32 %227, i32 0, i32 %231) #7, !srcloc !16
  store i32 %232, ptr %230, align 4, !tbaa !14
  %233 = load i32, ptr %16, align 4, !tbaa !14
  %234 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %232, i32 %233, i32 1, i32 %232) #7, !srcloc !17
  store i32 %234, ptr %230, align 4, !tbaa !14
  %235 = load i32, ptr %17, align 4, !tbaa !14
  %236 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %234, i32 %235, i32 2, i32 %234) #7, !srcloc !18
  store i32 %236, ptr %230, align 4, !tbaa !14
  %237 = load i32, ptr %18, align 4, !tbaa !14
  %238 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %236, i32 %237, i32 3, i32 %236) #7, !srcloc !19
  store i32 %238, ptr %230, align 4, !tbaa !14
  %239 = getelementptr inbounds nuw i8, ptr %230, i64 4
  %240 = load i32, ptr %239, align 4, !tbaa !14
  %241 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %240, i32 %233, i32 0, i32 %240) #7, !srcloc !20
  store i32 %241, ptr %239, align 4, !tbaa !14
  %242 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %241, i32 %235, i32 1, i32 %241) #7, !srcloc !21
  store i32 %242, ptr %239, align 4, !tbaa !14
  %243 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %242, i32 %237, i32 2, i32 %242) #7, !srcloc !22
  store i32 %243, ptr %239, align 4, !tbaa !14
  %244 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %243, i32 %227, i32 3, i32 %243) #7, !srcloc !23
  store i32 %244, ptr %239, align 4, !tbaa !14
  %245 = getelementptr inbounds nuw i8, ptr %230, i64 8
  %246 = load i32, ptr %245, align 4, !tbaa !14
  %247 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %246, i32 %235, i32 0, i32 %246) #7, !srcloc !24
  store i32 %247, ptr %245, align 4, !tbaa !14
  %248 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %247, i32 %237, i32 1, i32 %247) #7, !srcloc !25
  store i32 %248, ptr %245, align 4, !tbaa !14
  %249 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %248, i32 %227, i32 2, i32 %248) #7, !srcloc !26
  store i32 %249, ptr %245, align 4, !tbaa !14
  %250 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %249, i32 %233, i32 3, i32 %249) #7, !srcloc !27
  store i32 %250, ptr %245, align 4, !tbaa !14
  %251 = getelementptr inbounds nuw i8, ptr %230, i64 12
  %252 = load i32, ptr %251, align 4, !tbaa !14
  %253 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %252, i32 %237, i32 0, i32 %252) #7, !srcloc !28
  store i32 %253, ptr %251, align 4, !tbaa !14
  %254 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %253, i32 %227, i32 1, i32 %253) #7, !srcloc !29
  store i32 %254, ptr %251, align 4, !tbaa !14
  %255 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %254, i32 %233, i32 2, i32 %254) #7, !srcloc !30
  store i32 %255, ptr %251, align 4, !tbaa !14
  %256 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %255, i32 %235, i32 3, i32 %255) #7, !srcloc !31
  store i32 %256, ptr %251, align 4, !tbaa !14
  %257 = load i32, ptr %230, align 4, !tbaa !14
  %258 = load i32, ptr %239, align 4, !tbaa !14
  store i32 %258, ptr %16, align 4, !tbaa !14
  %259 = load i32, ptr %245, align 4, !tbaa !14
  store i32 %259, ptr %17, align 4, !tbaa !14
  store i32 %256, ptr %18, align 4, !tbaa !14
  %260 = getelementptr inbounds nuw i8, ptr %1, i64 144
  %261 = load i32, ptr %260, align 4, !tbaa !14
  %262 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %261, i32 %257, i32 0, i32 %261) #7, !srcloc !16
  store i32 %262, ptr %260, align 4, !tbaa !14
  %263 = load i32, ptr %16, align 4, !tbaa !14
  %264 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %262, i32 %263, i32 1, i32 %262) #7, !srcloc !17
  store i32 %264, ptr %260, align 4, !tbaa !14
  %265 = load i32, ptr %17, align 4, !tbaa !14
  %266 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %264, i32 %265, i32 2, i32 %264) #7, !srcloc !18
  store i32 %266, ptr %260, align 4, !tbaa !14
  %267 = load i32, ptr %18, align 4, !tbaa !14
  %268 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %266, i32 %267, i32 3, i32 %266) #7, !srcloc !19
  store i32 %268, ptr %260, align 4, !tbaa !14
  %269 = getelementptr inbounds nuw i8, ptr %260, i64 4
  %270 = load i32, ptr %269, align 4, !tbaa !14
  %271 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %270, i32 %263, i32 0, i32 %270) #7, !srcloc !20
  store i32 %271, ptr %269, align 4, !tbaa !14
  %272 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %271, i32 %265, i32 1, i32 %271) #7, !srcloc !21
  store i32 %272, ptr %269, align 4, !tbaa !14
  %273 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %272, i32 %267, i32 2, i32 %272) #7, !srcloc !22
  store i32 %273, ptr %269, align 4, !tbaa !14
  %274 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %273, i32 %257, i32 3, i32 %273) #7, !srcloc !23
  store i32 %274, ptr %269, align 4, !tbaa !14
  %275 = getelementptr inbounds nuw i8, ptr %260, i64 8
  %276 = load i32, ptr %275, align 4, !tbaa !14
  %277 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %276, i32 %265, i32 0, i32 %276) #7, !srcloc !24
  store i32 %277, ptr %275, align 4, !tbaa !14
  %278 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %277, i32 %267, i32 1, i32 %277) #7, !srcloc !25
  store i32 %278, ptr %275, align 4, !tbaa !14
  %279 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %278, i32 %257, i32 2, i32 %278) #7, !srcloc !26
  store i32 %279, ptr %275, align 4, !tbaa !14
  %280 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %279, i32 %263, i32 3, i32 %279) #7, !srcloc !27
  store i32 %280, ptr %275, align 4, !tbaa !14
  %281 = getelementptr inbounds nuw i8, ptr %260, i64 12
  %282 = load i32, ptr %281, align 4, !tbaa !14
  %283 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %282, i32 %267, i32 0, i32 %282) #7, !srcloc !28
  store i32 %283, ptr %281, align 4, !tbaa !14
  %284 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %283, i32 %257, i32 1, i32 %283) #7, !srcloc !29
  store i32 %284, ptr %281, align 4, !tbaa !14
  %285 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %284, i32 %263, i32 2, i32 %284) #7, !srcloc !30
  store i32 %285, ptr %281, align 4, !tbaa !14
  %286 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %285, i32 %265, i32 3, i32 %285) #7, !srcloc !31
  store i32 %286, ptr %281, align 4, !tbaa !14
  %287 = load i32, ptr %260, align 4, !tbaa !14
  %288 = load i32, ptr %269, align 4, !tbaa !14
  store i32 %288, ptr %16, align 4, !tbaa !14
  %289 = load i32, ptr %275, align 4, !tbaa !14
  store i32 %289, ptr %17, align 4, !tbaa !14
  store i32 %286, ptr %18, align 4, !tbaa !14
  store i32 %287, ptr %4, align 4
  %290 = getelementptr inbounds nuw i8, ptr %1, i64 160
  %291 = load i32, ptr %290, align 4, !tbaa !14
  %292 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %291, i32 %287, i32 0, i32 %291) #7, !srcloc !32
  store i32 %292, ptr %290, align 4, !tbaa !14
  %293 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %294 = load i32, ptr %293, align 4, !tbaa !14
  %295 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %292, i32 %294, i32 1, i32 %292) #7, !srcloc !33
  store i32 %295, ptr %290, align 4, !tbaa !14
  %296 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %297 = load i32, ptr %296, align 4, !tbaa !14
  %298 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %295, i32 %297, i32 2, i32 %295) #7, !srcloc !34
  store i32 %298, ptr %290, align 4, !tbaa !14
  %299 = getelementptr inbounds nuw i8, ptr %4, i64 12
  %300 = load i32, ptr %299, align 4, !tbaa !14
  %301 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %298, i32 %300, i32 3, i32 %298) #7, !srcloc !35
  store i32 %301, ptr %290, align 4, !tbaa !14
  %302 = getelementptr inbounds nuw i8, ptr %1, i64 164
  %303 = load i32, ptr %302, align 4, !tbaa !14
  %304 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %303, i32 %294, i32 0, i32 %303) #7, !srcloc !36
  store i32 %304, ptr %302, align 4, !tbaa !14
  %305 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %304, i32 %297, i32 1, i32 %304) #7, !srcloc !37
  store i32 %305, ptr %302, align 4, !tbaa !14
  %306 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %305, i32 %300, i32 2, i32 %305) #7, !srcloc !38
  store i32 %306, ptr %302, align 4, !tbaa !14
  %307 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %306, i32 %287, i32 3, i32 %306) #7, !srcloc !39
  store i32 %307, ptr %302, align 4, !tbaa !14
  %308 = getelementptr inbounds nuw i8, ptr %1, i64 168
  %309 = load i32, ptr %308, align 4, !tbaa !14
  %310 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %309, i32 %297, i32 0, i32 %309) #7, !srcloc !40
  store i32 %310, ptr %308, align 4, !tbaa !14
  %311 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %310, i32 %300, i32 1, i32 %310) #7, !srcloc !41
  store i32 %311, ptr %308, align 4, !tbaa !14
  %312 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %311, i32 %287, i32 2, i32 %311) #7, !srcloc !42
  store i32 %312, ptr %308, align 4, !tbaa !14
  %313 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %312, i32 %294, i32 3, i32 %312) #7, !srcloc !43
  store i32 %313, ptr %308, align 4, !tbaa !14
  %314 = getelementptr inbounds nuw i8, ptr %1, i64 172
  %315 = load i32, ptr %314, align 4, !tbaa !14
  %316 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %315, i32 %300, i32 0, i32 %315) #7, !srcloc !44
  store i32 %316, ptr %314, align 4, !tbaa !14
  %317 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %316, i32 %287, i32 1, i32 %316) #7, !srcloc !45
  store i32 %317, ptr %314, align 4, !tbaa !14
  %318 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %317, i32 %294, i32 2, i32 %317) #7, !srcloc !46
  store i32 %318, ptr %314, align 4, !tbaa !14
  %319 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %318, i32 %297, i32 3, i32 %318) #7, !srcloc !47
  store i32 %319, ptr %314, align 4, !tbaa !14
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %2, ptr noundef nonnull align 1 dereferenceable(16) %290, i64 noundef 16, i1 noundef false) #7
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #7
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind ssp uwtable(sync)
define void @aes128_ecb_encrypt(ptr nocapture noundef readonly %0, i64 noundef %1, ptr nocapture noundef readonly %2, ptr noundef %3) local_unnamed_addr #2 {
  %5 = alloca [176 x i8], align 1
  %6 = and i64 %1, 15
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %4
  %9 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %78

10:                                               ; preds = %4
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %5) #7
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %5, ptr noundef nonnull align 1 dereferenceable(16) %2, i64 16, i1 false), !tbaa !6
  br label %11

11:                                               ; preds = %44, %10
  %12 = phi i64 [ %67, %44 ], [ 16, %10 ]
  %13 = getelementptr i8, ptr %5, i64 %12
  %14 = getelementptr i8, ptr %13, i64 -4
  %15 = load i8, ptr %14, align 1, !tbaa !6
  %16 = getelementptr i8, ptr %13, i64 -3
  %17 = load i8, ptr %16, align 1, !tbaa !6
  %18 = getelementptr i8, ptr %13, i64 -2
  %19 = load i8, ptr %18, align 1, !tbaa !6
  %20 = getelementptr i8, ptr %13, i64 -1
  %21 = load i8, ptr %20, align 1, !tbaa !6
  %22 = and i64 %12, 12
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %24, label %44

24:                                               ; preds = %11
  %25 = zext i8 %17 to i64
  %26 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %25
  %27 = load i8, ptr %26, align 1, !tbaa !6
  %28 = zext i8 %19 to i64
  %29 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %28
  %30 = load i8, ptr %29, align 1, !tbaa !6
  %31 = zext i8 %21 to i64
  %32 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %31
  %33 = load i8, ptr %32, align 1, !tbaa !6
  %34 = zext i8 %15 to i64
  %35 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %34
  %36 = load i8, ptr %35, align 1, !tbaa !6
  %37 = trunc nuw nsw i64 %12 to i32
  %38 = lshr exact i32 %37, 4
  %39 = add nsw i32 %38, -1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [10 x i8], ptr @rcon, i64 0, i64 %40
  %42 = load i8, ptr %41, align 1, !tbaa !6
  %43 = xor i8 %42, %27
  br label %44

44:                                               ; preds = %24, %11
  %45 = phi i8 [ %36, %24 ], [ %21, %11 ]
  %46 = phi i8 [ %33, %24 ], [ %19, %11 ]
  %47 = phi i8 [ %30, %24 ], [ %17, %11 ]
  %48 = phi i8 [ %43, %24 ], [ %15, %11 ]
  %49 = getelementptr i8, ptr %13, i64 -16
  %50 = load i8, ptr %49, align 1, !tbaa !6
  %51 = xor i8 %50, %48
  store i8 %51, ptr %13, align 1, !tbaa !6
  %52 = getelementptr i8, ptr %13, i64 -15
  %53 = load i8, ptr %52, align 1, !tbaa !6
  %54 = xor i8 %53, %47
  %55 = or disjoint i64 %12, 1
  %56 = getelementptr inbounds nuw i8, ptr %5, i64 %55
  store i8 %54, ptr %56, align 1, !tbaa !6
  %57 = getelementptr i8, ptr %13, i64 -14
  %58 = load i8, ptr %57, align 1, !tbaa !6
  %59 = xor i8 %58, %46
  %60 = or disjoint i64 %12, 2
  %61 = getelementptr inbounds nuw i8, ptr %5, i64 %60
  store i8 %59, ptr %61, align 1, !tbaa !6
  %62 = getelementptr i8, ptr %13, i64 -13
  %63 = load i8, ptr %62, align 1, !tbaa !6
  %64 = xor i8 %63, %45
  %65 = or disjoint i64 %12, 3
  %66 = getelementptr inbounds nuw i8, ptr %5, i64 %65
  store i8 %64, ptr %66, align 1, !tbaa !6
  %67 = add nuw nsw i64 %12, 4
  %68 = icmp samesign ult i64 %12, 172
  br i1 %68, label %11, label %69, !llvm.loop !12

69:                                               ; preds = %44
  %70 = icmp eq i64 %1, 0
  br i1 %70, label %71, label %.preheader

.preheader:                                       ; preds = %69
  br label %72

.loopexit:                                        ; preds = %72
  br label %71

71:                                               ; preds = %.loopexit, %69
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %5) #7
  br label %78

72:                                               ; preds = %.preheader, %72
  %73 = phi i64 [ %76, %72 ], [ 0, %.preheader ]
  %74 = getelementptr inbounds nuw i8, ptr %0, i64 %73
  %75 = getelementptr inbounds nuw i8, ptr %3, i64 %73
  call void @aes128_encrypt_block(ptr noundef %74, ptr noundef nonnull %5, ptr noundef %75)
  %76 = add i64 %73, 16
  %77 = icmp ult i64 %76, %1
  br i1 %77, label %72, label %.loopexit, !llvm.loop !48

78:                                               ; preds = %71, %8
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @print_hex(ptr noundef %0, ptr nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #5 {
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef %0)
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %6, label %.preheader

.preheader:                                       ; preds = %3
  br label %8

.loopexit:                                        ; preds = %8
  br label %6

6:                                                ; preds = %.loopexit, %3
  %7 = tail call i32 @putchar(i32 10)
  ret void

8:                                                ; preds = %.preheader, %8
  %9 = phi i64 [ %14, %8 ], [ 0, %.preheader ]
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 %9
  %11 = load i8, ptr %10, align 1, !tbaa !6
  %12 = zext i8 %11 to i32
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %12)
  %14 = add nuw i64 %9, 1
  %15 = icmp eq i64 %14, %2
  br i1 %15, label %.loopexit, label %8, !llvm.loop !49
}

; Function Attrs: nounwind ssp uwtable(sync)
define noundef i32 @main() local_unnamed_addr #2 {
  %1 = alloca [176 x i8], align 1
  %2 = alloca [16 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #7
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %1) #7
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %1, ptr noundef nonnull readonly align 1 dereferenceable(16) @__const.main.key, i64 16, i1 false), !tbaa !6
  br label %3

3:                                                ; preds = %36, %0
  %4 = phi i64 [ %59, %36 ], [ 16, %0 ]
  %5 = getelementptr i8, ptr %1, i64 %4
  %6 = getelementptr i8, ptr %5, i64 -4
  %7 = load i8, ptr %6, align 1, !tbaa !6
  %8 = getelementptr i8, ptr %5, i64 -3
  %9 = load i8, ptr %8, align 1, !tbaa !6
  %10 = getelementptr i8, ptr %5, i64 -2
  %11 = load i8, ptr %10, align 1, !tbaa !6
  %12 = getelementptr i8, ptr %5, i64 -1
  %13 = load i8, ptr %12, align 1, !tbaa !6
  %14 = and i64 %4, 12
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %36

16:                                               ; preds = %3
  %17 = zext i8 %9 to i64
  %18 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %17
  %19 = load i8, ptr %18, align 1, !tbaa !6
  %20 = zext i8 %11 to i64
  %21 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %20
  %22 = load i8, ptr %21, align 1, !tbaa !6
  %23 = zext i8 %13 to i64
  %24 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %23
  %25 = load i8, ptr %24, align 1, !tbaa !6
  %26 = zext i8 %7 to i64
  %27 = getelementptr inbounds nuw [256 x i8], ptr @sbox, i64 0, i64 %26
  %28 = load i8, ptr %27, align 1, !tbaa !6
  %29 = trunc nuw nsw i64 %4 to i32
  %30 = lshr exact i32 %29, 4
  %31 = add nsw i32 %30, -1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [10 x i8], ptr @rcon, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1, !tbaa !6
  %35 = xor i8 %34, %19
  br label %36

36:                                               ; preds = %16, %3
  %37 = phi i8 [ %28, %16 ], [ %13, %3 ]
  %38 = phi i8 [ %25, %16 ], [ %11, %3 ]
  %39 = phi i8 [ %22, %16 ], [ %9, %3 ]
  %40 = phi i8 [ %35, %16 ], [ %7, %3 ]
  %41 = getelementptr i8, ptr %5, i64 -16
  %42 = load i8, ptr %41, align 1, !tbaa !6
  %43 = xor i8 %42, %40
  store i8 %43, ptr %5, align 1, !tbaa !6
  %44 = getelementptr i8, ptr %5, i64 -15
  %45 = load i8, ptr %44, align 1, !tbaa !6
  %46 = xor i8 %45, %39
  %47 = or disjoint i64 %4, 1
  %48 = getelementptr inbounds nuw i8, ptr %1, i64 %47
  store i8 %46, ptr %48, align 1, !tbaa !6
  %49 = getelementptr i8, ptr %5, i64 -14
  %50 = load i8, ptr %49, align 1, !tbaa !6
  %51 = xor i8 %50, %38
  %52 = or disjoint i64 %4, 2
  %53 = getelementptr inbounds nuw i8, ptr %1, i64 %52
  store i8 %51, ptr %53, align 1, !tbaa !6
  %54 = getelementptr i8, ptr %5, i64 -13
  %55 = load i8, ptr %54, align 1, !tbaa !6
  %56 = xor i8 %55, %37
  %57 = or disjoint i64 %4, 3
  %58 = getelementptr inbounds nuw i8, ptr %1, i64 %57
  store i8 %56, ptr %58, align 1, !tbaa !6
  %59 = add nuw nsw i64 %4, 4
  %60 = icmp samesign ult i64 %4, 172
  br i1 %60, label %3, label %61, !llvm.loop !12

61:                                               ; preds = %36
  call void @aes128_encrypt_block(ptr noundef nonnull readonly @__const.main.plaintext, ptr noundef nonnull %1, ptr noundef nonnull %2)
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %1) #7
  %62 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef nonnull @.str.4)
  br label %63

63:                                               ; preds = %63, %61
  %64 = phi i64 [ %69, %63 ], [ 0, %61 ]
  %65 = getelementptr inbounds nuw i8, ptr @__const.main.plaintext, i64 %64
  %66 = load i8, ptr %65, align 1, !tbaa !6
  %67 = zext i8 %66 to i32
  %68 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %67)
  %69 = add nuw nsw i64 %64, 1
  %70 = icmp eq i64 %69, 16
  br i1 %70, label %71, label %63, !llvm.loop !49

71:                                               ; preds = %63
  %72 = call i32 @putchar(i32 10)
  %73 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef nonnull @.str.5)
  br label %74

74:                                               ; preds = %74, %71
  %75 = phi i64 [ %80, %74 ], [ 0, %71 ]
  %76 = getelementptr inbounds nuw i8, ptr @__const.main.key, i64 %75
  %77 = load i8, ptr %76, align 1, !tbaa !6
  %78 = zext i8 %77 to i32
  %79 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %78)
  %80 = add nuw nsw i64 %75, 1
  %81 = icmp eq i64 %80, 16
  br i1 %81, label %82, label %74, !llvm.loop !49

82:                                               ; preds = %74
  %83 = call i32 @putchar(i32 10)
  %84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef nonnull @.str.6)
  br label %85

85:                                               ; preds = %85, %82
  %86 = phi i64 [ %91, %85 ], [ 0, %82 ]
  %87 = getelementptr inbounds nuw i8, ptr %2, i64 %86
  %88 = load i8, ptr %87, align 1, !tbaa !6
  %89 = zext i8 %88 to i32
  %90 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %89)
  %91 = add nuw nsw i64 %86, 1
  %92 = icmp eq i64 %91, 16
  br i1 %92, label %93, label %85, !llvm.loop !49

93:                                               ; preds = %85
  %94 = call i32 @putchar(i32 10)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #7
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #6

attributes #0 = { nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nofree nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 2]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Homebrew clang version 20.1.6"}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !7, i64 0}
!16 = !{i64 3819}
!17 = !{i64 4035}
!18 = !{i64 4251}
!19 = !{i64 4467}
!20 = !{i64 4683}
!21 = !{i64 4899}
!22 = !{i64 5115}
!23 = !{i64 5331}
!24 = !{i64 5547}
!25 = !{i64 5763}
!26 = !{i64 5979}
!27 = !{i64 6195}
!28 = !{i64 6411}
!29 = !{i64 6627}
!30 = !{i64 6843}
!31 = !{i64 7059}
!32 = !{i64 7769}
!33 = !{i64 7978}
!34 = !{i64 8187}
!35 = !{i64 8396}
!36 = !{i64 8605}
!37 = !{i64 8814}
!38 = !{i64 9023}
!39 = !{i64 9232}
!40 = !{i64 9441}
!41 = !{i64 9650}
!42 = !{i64 9859}
!43 = !{i64 10068}
!44 = !{i64 10277}
!45 = !{i64 10486}
!46 = !{i64 10695}
!47 = !{i64 10904}
!48 = distinct !{!48, !10, !11}
!49 = distinct !{!49, !10, !11}

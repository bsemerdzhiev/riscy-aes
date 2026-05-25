; ModuleID = 'aes_hardware.c'
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

3:                                                ; preds = %2, %3
  %4 = phi i64 [ 0, %2 ], [ %8, %3 ]
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 %4
  %6 = load i8, ptr %5, align 1, !tbaa !6
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 %4
  store i8 %6, ptr %7, align 1, !tbaa !6
  %8 = add nuw nsw i64 %4, 1
  %9 = icmp eq i64 %8, 16
  br i1 %9, label %10, label %3, !llvm.loop !9

10:                                               ; preds = %3, %43
  %11 = phi i64 [ %66, %43 ], [ 16, %3 ]
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @add_round_key(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  br label %4

3:                                                ; preds = %4
  ret void

4:                                                ; preds = %2, %4
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
  br label %50

19:                                               ; preds = %50
  store i32 %81, ptr %4, align 4
  %20 = getelementptr inbounds nuw i8, ptr %1, i64 160
  %21 = load i32, ptr %20, align 4, !tbaa !14
  %22 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %21, i32 %81, i32 0, i32 %21) #7, !srcloc !16
  store i32 %22, ptr %20, align 4, !tbaa !14
  %23 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %24 = load i32, ptr %23, align 4, !tbaa !14
  %25 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %22, i32 %24, i32 1, i32 %22) #7, !srcloc !17
  store i32 %25, ptr %20, align 4, !tbaa !14
  %26 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %27 = load i32, ptr %26, align 4, !tbaa !14
  %28 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %25, i32 %27, i32 2, i32 %25) #7, !srcloc !18
  store i32 %28, ptr %20, align 4, !tbaa !14
  %29 = getelementptr inbounds nuw i8, ptr %4, i64 12
  %30 = load i32, ptr %29, align 4, !tbaa !14
  %31 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %28, i32 %30, i32 3, i32 %28) #7, !srcloc !19
  store i32 %31, ptr %20, align 4, !tbaa !14
  %32 = getelementptr inbounds nuw i8, ptr %1, i64 164
  %33 = load i32, ptr %32, align 4, !tbaa !14
  %34 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %33, i32 %24, i32 0, i32 %33) #7, !srcloc !20
  store i32 %34, ptr %32, align 4, !tbaa !14
  %35 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %34, i32 %27, i32 1, i32 %34) #7, !srcloc !21
  store i32 %35, ptr %32, align 4, !tbaa !14
  %36 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %35, i32 %30, i32 2, i32 %35) #7, !srcloc !22
  store i32 %36, ptr %32, align 4, !tbaa !14
  %37 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %36, i32 %81, i32 3, i32 %36) #7, !srcloc !23
  store i32 %37, ptr %32, align 4, !tbaa !14
  %38 = getelementptr inbounds nuw i8, ptr %1, i64 168
  %39 = load i32, ptr %38, align 4, !tbaa !14
  %40 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %39, i32 %27, i32 0, i32 %39) #7, !srcloc !24
  store i32 %40, ptr %38, align 4, !tbaa !14
  %41 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %40, i32 %30, i32 1, i32 %40) #7, !srcloc !25
  store i32 %41, ptr %38, align 4, !tbaa !14
  %42 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %41, i32 %81, i32 2, i32 %41) #7, !srcloc !26
  store i32 %42, ptr %38, align 4, !tbaa !14
  %43 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %42, i32 %24, i32 3, i32 %42) #7, !srcloc !27
  store i32 %43, ptr %38, align 4, !tbaa !14
  %44 = getelementptr inbounds nuw i8, ptr %1, i64 172
  %45 = load i32, ptr %44, align 4, !tbaa !14
  %46 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %45, i32 %30, i32 0, i32 %45) #7, !srcloc !28
  store i32 %46, ptr %44, align 4, !tbaa !14
  %47 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %46, i32 %81, i32 1, i32 %46) #7, !srcloc !29
  store i32 %47, ptr %44, align 4, !tbaa !14
  %48 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %47, i32 %24, i32 2, i32 %47) #7, !srcloc !30
  store i32 %48, ptr %44, align 4, !tbaa !14
  %49 = tail call i32 asm sideeffect "aes32esi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %48, i32 %27, i32 3, i32 %48) #7, !srcloc !31
  store i32 %49, ptr %44, align 4, !tbaa !14
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %2, ptr noundef nonnull align 1 dereferenceable(16) %20, i64 noundef 16, i1 noundef false) #7
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #7
  ret void

50:                                               ; preds = %14, %50
  %51 = phi i64 [ 1, %14 ], [ %84, %50 ]
  %52 = phi i32 [ %15, %14 ], [ %81, %50 ]
  %53 = shl nuw nsw i64 %51, 4
  %54 = getelementptr inbounds nuw i8, ptr %1, i64 %53
  %55 = load i32, ptr %54, align 4, !tbaa !14
  %56 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %55, i32 %52, i32 0, i32 %55) #7, !srcloc !32
  store i32 %56, ptr %54, align 4, !tbaa !14
  %57 = load i32, ptr %16, align 4, !tbaa !14
  %58 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %56, i32 %57, i32 1, i32 %56) #7, !srcloc !33
  store i32 %58, ptr %54, align 4, !tbaa !14
  %59 = load i32, ptr %17, align 4, !tbaa !14
  %60 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %58, i32 %59, i32 2, i32 %58) #7, !srcloc !34
  store i32 %60, ptr %54, align 4, !tbaa !14
  %61 = load i32, ptr %18, align 4, !tbaa !14
  %62 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %60, i32 %61, i32 3, i32 %60) #7, !srcloc !35
  store i32 %62, ptr %54, align 4, !tbaa !14
  %63 = getelementptr inbounds nuw i8, ptr %54, i64 4
  %64 = load i32, ptr %63, align 4, !tbaa !14
  %65 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %64, i32 %57, i32 0, i32 %64) #7, !srcloc !36
  store i32 %65, ptr %63, align 4, !tbaa !14
  %66 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %65, i32 %59, i32 1, i32 %65) #7, !srcloc !37
  store i32 %66, ptr %63, align 4, !tbaa !14
  %67 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %66, i32 %61, i32 2, i32 %66) #7, !srcloc !38
  store i32 %67, ptr %63, align 4, !tbaa !14
  %68 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %67, i32 %52, i32 3, i32 %67) #7, !srcloc !39
  store i32 %68, ptr %63, align 4, !tbaa !14
  %69 = getelementptr inbounds nuw i8, ptr %54, i64 8
  %70 = load i32, ptr %69, align 4, !tbaa !14
  %71 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %70, i32 %59, i32 0, i32 %70) #7, !srcloc !40
  store i32 %71, ptr %69, align 4, !tbaa !14
  %72 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %71, i32 %61, i32 1, i32 %71) #7, !srcloc !41
  store i32 %72, ptr %69, align 4, !tbaa !14
  %73 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %72, i32 %52, i32 2, i32 %72) #7, !srcloc !42
  store i32 %73, ptr %69, align 4, !tbaa !14
  %74 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %73, i32 %57, i32 3, i32 %73) #7, !srcloc !43
  store i32 %74, ptr %69, align 4, !tbaa !14
  %75 = getelementptr inbounds nuw i8, ptr %54, i64 12
  %76 = load i32, ptr %75, align 4, !tbaa !14
  %77 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %76, i32 %61, i32 0, i32 %76) #7, !srcloc !44
  store i32 %77, ptr %75, align 4, !tbaa !14
  %78 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %77, i32 %52, i32 1, i32 %77) #7, !srcloc !45
  store i32 %78, ptr %75, align 4, !tbaa !14
  %79 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %78, i32 %57, i32 2, i32 %78) #7, !srcloc !46
  store i32 %79, ptr %75, align 4, !tbaa !14
  %80 = tail call i32 asm sideeffect "aes32esmi $0, $1, $2, $3", "=r,r,r,I,0"(i32 %79, i32 %59, i32 3, i32 %79) #7, !srcloc !47
  store i32 %80, ptr %75, align 4, !tbaa !14
  %81 = load i32, ptr %54, align 4, !tbaa !14
  %82 = load i32, ptr %63, align 4, !tbaa !14
  store i32 %82, ptr %16, align 4, !tbaa !14
  %83 = load i32, ptr %69, align 4, !tbaa !14
  store i32 %83, ptr %17, align 4, !tbaa !14
  store i32 %80, ptr %18, align 4, !tbaa !14
  %84 = add nuw nsw i64 %51, 1
  %85 = icmp eq i64 %84, 10
  br i1 %85, label %19, label %50, !llvm.loop !48
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
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

11:                                               ; preds = %10, %44
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
  br i1 %70, label %71, label %72

71:                                               ; preds = %72, %69
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %5) #7
  br label %78

72:                                               ; preds = %69, %72
  %73 = phi i64 [ %76, %72 ], [ 0, %69 ]
  %74 = getelementptr inbounds nuw i8, ptr %0, i64 %73
  %75 = getelementptr inbounds nuw i8, ptr %3, i64 %73
  call void @aes128_encrypt_block(ptr noundef %74, ptr noundef nonnull %5, ptr noundef %75)
  %76 = add i64 %73, 16
  %77 = icmp ult i64 %76, %1
  br i1 %77, label %72, label %71, !llvm.loop !49

78:                                               ; preds = %71, %8
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @print_hex(ptr noundef %0, ptr nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #5 {
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef %0)
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %8, %3
  %7 = tail call i32 @putchar(i32 10)
  ret void

8:                                                ; preds = %3, %8
  %9 = phi i64 [ %14, %8 ], [ 0, %3 ]
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 %9
  %11 = load i8, ptr %10, align 1, !tbaa !6
  %12 = zext i8 %11 to i32
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %12)
  %14 = add nuw i64 %9, 1
  %15 = icmp eq i64 %14, %2
  br i1 %15, label %6, label %8, !llvm.loop !50
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
  br i1 %70, label %71, label %63, !llvm.loop !50

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
  br i1 %81, label %82, label %74, !llvm.loop !50

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
  br i1 %92, label %93, label %85, !llvm.loop !50

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
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
!16 = !{i64 7769}
!17 = !{i64 7978}
!18 = !{i64 8187}
!19 = !{i64 8396}
!20 = !{i64 8605}
!21 = !{i64 8814}
!22 = !{i64 9023}
!23 = !{i64 9232}
!24 = !{i64 9441}
!25 = !{i64 9650}
!26 = !{i64 9859}
!27 = !{i64 10068}
!28 = !{i64 10277}
!29 = !{i64 10486}
!30 = !{i64 10695}
!31 = !{i64 10904}
!32 = !{i64 3819}
!33 = !{i64 4035}
!34 = !{i64 4251}
!35 = !{i64 4467}
!36 = !{i64 4683}
!37 = !{i64 4899}
!38 = !{i64 5115}
!39 = !{i64 5331}
!40 = !{i64 5547}
!41 = !{i64 5763}
!42 = !{i64 5979}
!43 = !{i64 6195}
!44 = !{i64 6411}
!45 = !{i64 6627}
!46 = !{i64 6843}
!47 = !{i64 7059}
!48 = distinct !{!48, !10, !11}
!49 = distinct !{!49, !10, !11}
!50 = distinct !{!50, !10, !11}

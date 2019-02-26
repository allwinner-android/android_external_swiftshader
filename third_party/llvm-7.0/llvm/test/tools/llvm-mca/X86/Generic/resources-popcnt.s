# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -instruction-tables < %s | FileCheck %s

popcntw     %cx, %cx
popcntw     (%rax), %cx

popcntl     %eax, %ecx
popcntl     (%rax), %ecx

popcntq     %rax, %rcx
popcntq     (%rax), %rcx

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      3     1.00                        popcntw	%cx, %cx
# CHECK-NEXT:  2      9     1.00    *                   popcntw	(%rax), %cx
# CHECK-NEXT:  1      3     1.00                        popcntl	%eax, %ecx
# CHECK-NEXT:  2      9     1.00    *                   popcntl	(%rax), %ecx
# CHECK-NEXT:  1      3     1.00                        popcntq	%rax, %rcx
# CHECK-NEXT:  2      9     1.00    *                   popcntq	(%rax), %rcx

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SBDivider
# CHECK-NEXT: [1]   - SBFPDivider
# CHECK-NEXT: [2]   - SBPort0
# CHECK-NEXT: [3]   - SBPort1
# CHECK-NEXT: [4]   - SBPort4
# CHECK-NEXT: [5]   - SBPort5
# CHECK-NEXT: [6.0] - SBPort23
# CHECK-NEXT: [6.1] - SBPort23

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]
# CHECK-NEXT:  -      -      -     6.00    -      -     1.50   1.50

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     popcntw	%cx, %cx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   popcntw	(%rax), %cx
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     popcntl	%eax, %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   popcntl	(%rax), %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     popcntq	%rax, %rcx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   popcntq	(%rax), %rcx

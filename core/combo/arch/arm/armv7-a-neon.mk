# Configuration for Linux on ARM.
# Generating binaries for the ARMv7-a architecture and higher with NEON
#
ARCH_ARM_HAVE_THUMB_SUPPORT     := true
ARCH_ARM_HAVE_FAST_INTERWORKING := true
ARCH_ARM_HAVE_64BIT_DATA        := true
ARCH_ARM_HAVE_HALFWORD_MULTIPLY := true
ARCH_ARM_HAVE_CLZ               := true
ARCH_ARM_HAVE_FFS               := true
ARCH_ARM_HAVE_ARMV7A            := true
ARCH_ARM_HAVE_TLS_REGISTER      := true
ARCH_ARM_HAVE_VFP               := true
ARCH_ARM_HAVE_VFP_D32           := true
ARCH_ARM_HAVE_NEON              := true

# Note: Hard coding the 'tune' value here is probably not ideal,
# and a better solution should be found in the future.
#
arch_variant_cflags := \
    -march=armv7-a \
    -mfloat-abi=softfp \
    -mfpu=neon

arch_variant_ldflags := \
ifneq (,$(findstring cpu=cortex-a9,$(TARGET_EXTRA_CFLAGS)))
	-Wl,--no-fix-cortex-a8
else
	-Wl,--fix-cortex-a8
endif

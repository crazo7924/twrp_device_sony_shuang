LOCAL_PATH := $(call my-dir)

$(INSTALLED_RECOVERYIMAGE_TARGET): \
		$(MKBOOTIMG) \
		$(recovery_ramdisk)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) \
		--kernel $(PRODUCT_OUT)/kernel \
		--ramdisk $(recovery_ramdisk) \
		--cmdline "$(BOARD_KERNEL_CMDLINE)" \
		--base $(BOARD_KERNEL_BASE) \
		--pagesize $(BOARD_KERNEL_PAGESIZE) \
		--dt $(PRODUCT_OUT)/dt.img \
		$(BOARD_MKBOOTIMG_ARGS) \
		--output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	$(call pretty,"Made recovery image: $@")

$(INSTALLED_BOOTIMAGE_TARGET): \
		$(MKBOOTIMG) \
		$(INTERNAL_BOOTIMAGE_FILES) \
		$(INSTALLED_DTIMAGE_TARGET)
	@echo -e ${CL_CYN}"----- Making boot image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) \
		$(INTERNAL_BOOTIMAGE_ARGS) \
		$(BOARD_MKBOOTIMG_ARGS) \
		--dt $(PRODUCT_OUT)/dt.img \
		--output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	$(call pretty,"Made boot image: $@")

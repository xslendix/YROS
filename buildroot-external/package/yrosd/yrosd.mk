################################################################################
#
# yrosd
#
################################################################################

YROSD_VERSION = ef7327d806db5ded7c618b1de01e923161adfe22
YROSD_SITE = https://github.com/xslendix/yrosd.git
YROSD_SITE_METHOD = git

YROSD_LICENSE = GPL-3.0
YROSD_LICENSE_FILES = LICENSE.txt

YROSD_GIT_SUBMODULES = YES

YROSD_INSTALL_STAGING = YES
YROSD_DEPENDENCIES += spdlog

define YROSD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 644 $(BR2_EXTERNAL_YROS_PATH)/package/yrosd/yrosd.service \
		$(TARGET_DIR)/usr/lib/systemd/system/yrosd.service
	touch $(TARGET_DIR)/etc/yrosd.conf

	$(INSTALL) -m 0644 -D $(@D)/yrosd.conf \
		$(TARGET_DIR)/etc/yrosd.conf

	$(INSTALL) -m 0755 -D $(@D)/yrosd \
		$(TARGET_DIR)/bin/yrosd
endef

YROSD_POST_INSTALL_TARGET_HOOKS += YROSD_INSTALL_TARGET_CMDS

ifeq ($(BR2_PACKAGE_OPENCV4),y)
YROSD_CONF_OPTS += -DUSE_OPENCV=1
YROSD_DEPENDENCIES += opencv4
BR2_PACKAGE_OPENCV4_LIB_IMGCODECS=y
else
YROSD_CONF_OPTS += -DUSE_OPENCV=0
endif

$(eval $(cmake-package))

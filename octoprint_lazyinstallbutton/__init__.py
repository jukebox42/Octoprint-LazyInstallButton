# coding=utf-8
from __future__ import absolute_import, unicode_literals

import octoprint.plugin


class LazyInstallButton(octoprint.plugin.StartupPlugin,
                        octoprint.plugin.TemplatePlugin,
                        octoprint.plugin.SettingsPlugin,
                        octoprint.plugin.AssetPlugin):

  def __init__(self):
    return

  # ======== TemplatePlugin ========

  def get_template_configs(self):
    return [
      dict(type="settings", custom_bindings=False)
    ]

  # ======== AssetPlugin ========

  def get_assets(self):
    return dict(
      js=["lazyinstallbutton.js"]
    )

  # ======== SettingsPlugin ========

  def get_settings_defaults(self):
    return dict(
      enabled=True
    )


__plugin_name__ = "Lazy Install Button"
__plugin_pythoncompat__ = ">=3,<4"
__plugin_implementation__ = LazyInstallButton()
__plugin_hooks__ = {}
require "lcgstyle/version"

# ensure the desired target version of RuboCop is gem activated
gem "rubocop", "= #{Lcgstyle::RUBOCOP_VERSION}"
require "rubocop"

module RuboCop
  class ConfigLoader
    RUBOCOP_HOME.gsub!(
      /^.*$/,
      File.realpath(File.join(File.dirname(__FILE__), ".."))
    )

    DEFAULT_FILE.gsub!(
      /^.*$/,
      File.join(RUBOCOP_HOME, "config", "default.yml")
    )
  end
end

# Lcgstyle patches the RuboCop tool to set a new default configuration that
# is vendored in the Lcgstyle codebase.
module Lcgstyle
  # @return [String] the absolute path to the main RuboCop configuration YAML
  #   file
  def self.config
    RuboCop::ConfigLoader::DEFAULT_FILE
  end
end

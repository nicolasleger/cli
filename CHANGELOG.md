# Hanami::CLI
General purpose Command Line Interface (CLI) framework for Ruby

## v0.1.1 - 2018-02-27
### Added
- [Luca Guidi] Official support for Ruby: MRI 2.5

### Fixed
- [Alfonso Uceda] Ensure default values for arguments to be sent to commands
- [Alfonso Uceda] Ensure to fail when a missing required argument isn't provider, but an option is provided instead

## v0.1.0 - 2017-10-25

## v0.1.0.rc1 - 2017-10-16

## v0.1.0.beta3 - 2017-10-04

## v0.1.0.beta2 - 2017-10-03
### Added
- [Alfonso Uceda] Allow default value for arguments

## v0.1.0.beta1 - 2017-08-11
### Added
- [Alfonso Uceda, Luca Guidi] Commands banner and usage
- [Alfonso Uceda] Added support for subcommands
- [Alfonso Uceda] Validations for arguments and options
- [Alfonso Uceda] Commands arguments and options
- [Alfonso Uceda] Commands description
- [Alfonso Uceda, Oana Sipos] Commands aliases
- [Luca Guidi] Exit on unknown command
- [Luca Guidi, Alfonso Uceda, Oana Sipos] Command lookup
- [Luca Guidi, Tim Riley] Trie based registry to register commands and allow third-parties to override/add commands

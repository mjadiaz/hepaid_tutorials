# hep-aid tutorials

To replicate the BLSSM Higgs masses example, the following software packages must be installed: SPheno, HiggsBounds, HiggsSignals, and MadGraph. Once installed, modify the `hep_stack_config.yml` file to include the corresponding directory paths.

Generate an example configuration file using the following command:
```
hepaid generate-config-template
```
If the HEP Stack is not already installed, run the following commands to install it:
```
cd blssm/hepstack
hepaid install-hepstack-cli
```

Test examples can be generated using the scripts located in the `test_functions` folder.




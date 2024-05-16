*** Settings ***
Documentation    This is for loading configuration
Variables    ../config.yaml
Library    OperatingSystem

*** Variables ***
${DEFAULT_ENV}    DEVELOP

*** Keywords ***
Load Configuration
    [Documentation]    Load configuration from yaml file
    ${ENV}    Get Environment Variable    CONFIG_FILE    ${DEFAULT_ENV}
    RETURN    &{${ENV}}

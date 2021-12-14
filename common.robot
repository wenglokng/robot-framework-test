*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary




*** Keywords ***
Login
    [arguments]     ${email_field}    ${password_field}
    Open Browser   url=https://app.deriv.com   browser=chrome
    set window size     1920    1080
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element   ${login_btn}  60
    Click element   ${login_btn}
    wait until page contains element   ${email}  15
    input text    ${email}       ${email_field}
    input text  ${password}   ${password_field}
    Click element  ${login_oauth_btn}
SwitchAcc
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    set window size     1920    1080
    Click element   ${core_acc_info}
    Click element   ${switch_to_demo}
    Click element   ${click_onto_demo}
BuyRiseContract
#    wait until page does not contain element    ${loading_chart}       60
    set window size     1920    1080
    Click element   ${menu}
    wait until page contains element    ${tradebox}       5
    sleep   5
    Click element   ${pick_volatility_10}
#    wait until page does not contain element   ${pick_volatility_10}     10
    sleep   5
    Click element   ${click_on_rise}
#    Click element   ${open_setting}
BuyLowerContract
     sleep  5
     wait until page contains element    ${votality_tab}      120
     click element      ${menu}
     wait until page contains element    ${votality_tab}      120
     click element      ${forex_tab}
     sleep   5
     click element      ${click_on_aud/usd}
     wait until page contains element        ${click_on_trade_types}   10
     click element      ${click_on_trade_types}
     click element   ${click_high_lower_option}
     sleep  5
     click element     ${input_field}
     ClearInputField    ${input_field}
     input text    ${input_field}       2
     click element  ${payout_button}
     ClearInputField    ${payout_input_field}
     input text     ${payout_input_field}     15.50
     sleep  2
     click element      ${click_on_lower_button}
CheckRelativeBarrierError
     sleep  2
     click element     ${barrier_input_field}
     ClearInputField    ${barrier_input_field}
     input text     ${barrier_input_field}     +1
     sleep  2
     ClearInputField    ${payout_input_field}
     input text     ${payout_input_field}     10
CheckMultipierParameter
    sleep   2
    wait until page contains element    ${votality_tab}      120
    click element      ${menu}
    wait until page contains element    ${votality_tab}      120
    click element      ${synthetic_tab}
    sleep   5
    click element       ${syntehtic_50_option}
    wait until page contains element        ${click_on_trade_types}   10
    click element      ${click_on_trade_types}
    click element   ${pick_multipier}
ClearInputField
    [Arguments]    ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE
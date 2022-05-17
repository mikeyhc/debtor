-module(debtor_account_tests).

-include_lib("eunit/include/eunit.hrl").

debtor_account_create_test() ->
    Account = debtor_account:create(<<"test-name">>, <<"test-bank">>),
    AccountMap = debtor_account:to_map(Account),
    Expected = #{name => <<"test-name">>,
                 bank => <<"test-bank">>,
                 entries => []
                },
    ?assertEqual(Expected, AccountMap).

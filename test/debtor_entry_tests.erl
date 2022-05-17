-module(debtor_entry_tests).
-include_lib("eunit/include/eunit.hrl").

debtor_entry_create_test() ->
    Entry = debtor_entry:create(
              <<"test-name">>,
              100,
              <<"test-category">>,
              false,
              undefined
             ),
    EntryMap = debtor_entry:to_map(Entry),
    Expected = #{name => <<"test-name">>,
                 value => 100,
                 category => <<"test-category">>,
                 reciept => false,
                 note => undefined},
    ?assertEqual(Expected, EntryMap).

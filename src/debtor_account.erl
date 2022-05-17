-module(debtor_account).

-export([create/2, to_map/1]).

-export_type([debtor_account/0, debtor_account_map/0]).

-record(debtor_account, {name :: binary(),
                         bank :: binary(),
                         entries=[] :: [debtor_account:debtor_account()]
                        }).

-opaque debtor_account() :: #debtor_account{}.
-type debtor_account_map() :: #{name => binary(),
                                bank => binary(),
                                entries => [debtor_account_map()]
                               }.

-spec create(binary(), binary()) -> debtor_account().
create(Name, Bank) ->
    #debtor_account{name=Name, bank=Bank}.

-spec to_map(debtor_account()) -> debtor_account_map().
to_map(#debtor_account{name=Name, bank=Bank, entries=Entries}) ->
    #{name => Name,
      bank => Bank,
      entries => lists:map(fun debtor_entry:to_map/1, Entries)
     }.

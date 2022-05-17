-module(debtor_entry).

-export([create/5, to_map/1]).

-export_type([debtor_entry/0, debtor_entry_map/0]).

-record(debtor_entry, {name :: binary(),
                       value :: integer(),
                       category :: binary(),
                       reciept :: boolean(),
                       note :: undefined | binary()
                      }).

-opaque debtor_entry() :: #debtor_entry{}.
-type debtor_entry_map() :: #{name => binary(),
                              value => integer(), category => binary(),
                              reciept => boolean(),
                              note => undefined | binary()
                             }.

-spec create(binary(), integer(), binary(), boolean(), undefined | binary())
    -> debtor_entry().
create(Name, Value, Category, Reciept, Note) ->
    #debtor_entry{name = Name,
                  value = Value,
                  category = Category,
                  reciept = Reciept,
                  note = Note
                 }.

-spec to_map(debtor_entry()) -> debtor_entry_map().
to_map(#debtor_entry{name=Name, value=Value, category=Category, reciept=Reciept,
                     note=Note}) ->
    #{name => Name,
      value => Value,
      category => Category,
      reciept => Reciept,
      note => Note
     }.

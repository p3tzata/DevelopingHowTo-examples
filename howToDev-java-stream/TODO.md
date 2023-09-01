.collect(Collectors.toMap(Entry::getKey, Entry::getValue));
.collect(Collectors.toMap(SomeEntity::getId,Function.identity()))
.collect(toMap(SomeEntity::getId, Function.identity(), (oldValue, newValue) -> oldValue));


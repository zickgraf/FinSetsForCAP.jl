
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSetNC( [ 1, 3, 2 ] )
<An object in FinSets>

julia> Display( S )
[ 1, 3, 2 ]

julia> L = AsList( S );

julia> Display( L )
[ 1, 3, 2 ]

julia> Q = FinSetNC( L )
<An object in FinSets>

julia> S == Q
true

julia> S = ObjectConstructor( FinSets, [ 1, 3, 2 ] )
<An object in FinSets>

julia> Display( S )
[ 1, 3, 2 ]

julia> L = ObjectDatum( S );

julia> Display( L )
[ 1, 3, 2 ]

julia> Q = ObjectConstructor( FinSets, L )
<An object in FinSets>

julia> S == Q
true

julia> FinSetNC( [ 1, 2 ] ) == FinSetNC( [ 2, 1 ] )
false

```

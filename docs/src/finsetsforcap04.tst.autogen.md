
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> S = FinSetNC( [ 1, 3, 2 ] )
<An object in FinSets>

julia> T = FinSetNC( [ "a", "b", "c" ] )
<An object in FinSets>

julia> G = [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ];

julia> phi = MapOfFinSetsNC( S, G, T )
<A morphism in FinSets>

julia> IsWellDefined( phi )
true

julia> phi( 1 )
"b"

julia> phi( 2 )
"a"

julia> phi( 3 )
"b"

julia> Display( List( S, phi ) )
[ "b", "b", "a" ]

julia> psi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> psi = MapOfFinSetsNC( S, psi, T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
true

julia> phi == psi
true

```

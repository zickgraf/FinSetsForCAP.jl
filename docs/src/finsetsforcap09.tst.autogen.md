
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> T = FinSet( [ "a", "b" ] )
<An object in FinSets>

julia> phi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> phi = MapOfFinSets( S, phi, T )
<A morphism in FinSets>

julia> psi = [ [ "a", 3 ], [ "b", 1 ] ];

julia> psi = MapOfFinSets( T, psi, S )
<A morphism in FinSets>

julia> alpha = PreCompose( phi, psi )
<A morphism in FinSets>

julia> Display( List( S, alpha ) )
[ 1, 3, 1 ]

julia> IsOne( alpha )
false

```

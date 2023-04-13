
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( [ ] )
<An object in FinSets>

julia> M = FinSet( [ 2 ] )
<An object in FinSets>

julia> N = FinSet( [ 3 ] )
<An object in FinSets>

julia> IsHomSetInhabited( L, L )
true

julia> IsHomSetInhabited( M, L )
false

julia> IsHomSetInhabited( L, M )
true

julia> IsHomSetInhabited( M, N )
true

```
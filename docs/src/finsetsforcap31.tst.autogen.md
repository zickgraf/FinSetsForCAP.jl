
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( 0 )
|0|

julia> M = FinSet( 2 )
|2|

julia> N = FinSet( 3 )
|3|

julia> IsHomSetInhabited( L, L )
true

julia> IsHomSetInhabited( M, L )
false

julia> IsHomSetInhabited( L, M )
true

julia> IsHomSetInhabited( M, N )
true

```

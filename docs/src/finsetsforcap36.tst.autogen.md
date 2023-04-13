
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> I = FinSet( 0 )
|0|

julia> T = FinSet( 1 )
|1|

julia> M = FinSet( 2 )
|2|

julia> IsProjective( I )
true

julia> IsProjective( T )
true

julia> IsProjective( M )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( I ) )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( M ) )
true

```

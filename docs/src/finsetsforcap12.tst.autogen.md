
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> I = FinSet( [ ] )
<An object in FinSets>

julia> T = FinSet( [ 1 ] )
<An object in FinSets>

julia> M = FinSet( [ 2 ] )
<An object in FinSets>

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

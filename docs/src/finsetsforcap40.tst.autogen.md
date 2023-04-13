
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> IsWellDefined( phi )
true

julia> ImageObject( phi )
|2|

julia> Length( ImageObject( phi ) )
2

julia> s = FinSet( 2 )
|2|

julia> I = ImageObject( phi, s )
|2|

julia> Length( I )
2

```

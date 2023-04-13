
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

julia> f = CoastrictionToImage( phi )
|3| → |2|

julia> Display( f )
[ 0, 1, 2 ] ⱶ[ 1, 0, 0 ]→ [ 0, 1 ]

julia> IsWellDefined( f )
true

julia> IsEpimorphism( f )
true

julia> IsSplitEpimorphism( f )
true

julia> m = FinSet( 77 )
|77|

julia> n = FinSet( 4 )
|4|

julia> phi = MapOfFinSets( n, [ 76, 1, 24, 1 ], m )
|4| → |77|

julia> IsWellDefined( phi )
true

julia> iota = ImageEmbedding( phi )
|3| → |77|

julia> pi = CoastrictionToImage( phi )
|4| → |3|

julia> Display( pi )
[ 0,..., 3 ] ⱶ[ 2, 0, 1, 0 ]→ [ 0, 1, 2 ]

julia> IsWellDefined( pi )
true

julia> IsEpimorphism( pi )
true

julia> IsSplitEpimorphism( pi )
true

julia> PreCompose( pi, iota ) == phi
true

```

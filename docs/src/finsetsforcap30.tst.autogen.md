
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> s = FinSet( 3 )
|3|

julia> t = FinSet( 7 )
|7|

julia> phi = MapOfFinSets( s, [ 6, 4, 4 ], t )
|3| → |7|

julia> Display( AsList( phi ) )
[ 6, 4, 4 ]

julia> IsWellDefined( phi )
true

julia> Display( phi )
[ 0, 1, 2 ] ⱶ[ 6, 4, 4 ]→ [ 0,..., 6 ]

julia> StringGAP( phi )
"MapOfFinSets( SkeletalFinSets, FinSet( SkeletalFinSets, 3 ), [ 6, 4, 4 ], FinSet( SkeletalFinSets, 7 ) )"

julia> s = ObjectConstructor( SkeletalFinSets, 3 )
|3|

julia> t = ObjectConstructor( SkeletalFinSets, 7 )
|7|

julia> phi = MorphismConstructor( s, [ 6, 4, 4 ], t )
|3| → |7|

julia> Display( MorphismDatum( phi ) )
[ 6, 4, 4 ]

julia> IsWellDefined( phi )
true

julia> Display( phi )
[ 0, 1, 2 ] ⱶ[ 6, 4, 4 ]→ [ 0,..., 6 ]

```

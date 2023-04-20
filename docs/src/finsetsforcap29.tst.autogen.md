
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> Display( m )
[ 0,..., 6 ]

julia> IsWellDefined( m )
true

julia> StringGAP( m )
"FinSet( SkeletalFinSets, 7 )"

julia> Display( List( m, x -> x^2 ) )
[ 0, 1, 4, 9, 16, 25, 36 ]

julia> L = ObjectDatum( m )
7

julia> mm = ObjectConstructor( SkeletalFinSets, BigInt( 7 ) )
|7|

julia> m == mm
true

julia> n = FinSet( -2 )
|-2|

julia> IsWellDefined( n )
false

julia> n = FinSet( 3 )
|3|

julia> IsWellDefined( n )
true

julia> p = FinSet( 4 )
|4|

julia> IsWellDefined( p )
true

julia> IsEqualForObjects( m, n )
false

```


```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> p = FinSet( 4 )
|4|

julia> c = Coproduct( m, n, p )
|14|

julia> Display( AsList( c ) )
[ 0 .. 13 ]

julia> iota1 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 )
|7| → |14|

julia> IsWellDefined( iota1 )
true

julia> Display( iota1 )
[ 0,..., 6 ] ⱶ[ 0 .. 6 ]→ [ 0,..., 13 ]

julia> iota2 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 2 )
|3| → |14|

julia> IsWellDefined( iota2 )
true

julia> Display( iota2 )
[ 0, 1, 2 ] ⱶ[ 7 .. 9 ]→ [ 0,..., 13 ]

julia> iota3 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 )
|4| → |14|

julia> IsWellDefined( iota3 )
true

julia> Display( iota3 )
[ 0,..., 3 ] ⱶ[ 10 .. 13 ]→ [ 0,..., 13 ]

julia> psi = UniversalMorphismFromCoproduct(
                       [ m, n, p ], [ iota1, iota2, iota3 ] )
|14| → |14|

julia> id = IdentityMorphism( Coproduct( [ m, n, p ] ) )
|14| → |14|

julia> psi == id
true

```

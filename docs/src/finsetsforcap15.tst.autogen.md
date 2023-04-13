
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> Length( S )
3

julia> T = FinSet( [ "a", "b" ] )
<An object in FinSets>

julia> Length( T )
2

julia> C = Coproduct( T, S )
<An object in FinSets>

julia> Length( C )
5

julia> Display( C )
[ [ 1, "a" ], [ 1, "b" ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ] ]

julia> M = FinSet( [ 1, 2, 3, 4, 5, 6, 7 ] )
<An object in FinSets>

julia> N = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> P = FinSet( [ 1, 2, 3, 4 ] )
<An object in FinSets>

julia> C = Coproduct( M, N, P )
<An object in FinSets>

julia> Display( AsList( C ) )
[ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]

julia> iota1 = InjectionOfCofactorOfCoproduct( [ M, N, P ], 1 )
<A morphism in FinSets>

julia> IsWellDefined( iota1 )
true

julia> Display( AsList( iota1 ) )
[ [ 1, [ 1, 1 ] ], [ 2, [ 1, 2 ] ], [ 3, [ 1, 3 ] ], [ 4, [ 1, 4 ] ], [ 5, [ 1, 5 ] ], [ 6, [ 1, 6 ] ], [ 7, [ 1, 7 ] ] ]

julia> iota2 = InjectionOfCofactorOfCoproduct( [ M, N, P ], 2 )
<A morphism in FinSets>

julia> IsWellDefined( iota2 )
true

julia> Display( AsList( iota2 ) )
[ [ 1, [ 2, 1 ] ], [ 2, [ 2, 2 ] ], [ 3, [ 2, 3 ] ] ]

julia> iota3 = InjectionOfCofactorOfCoproduct( [ M, N, P ], 3 )
<A morphism in FinSets>

julia> IsWellDefined( iota3 )
true

julia> Display( AsList( iota3 ) )
[ [ 1, [ 3, 1 ] ], [ 2, [ 3, 2 ] ], [ 3, [ 3, 3 ] ], [ 4, [ 3, 4 ] ] ]

julia> psi = UniversalMorphismFromCoproduct( [ M, N, P ],
                                               [ iota1, iota2, iota3 ]
                                             )
<A morphism in FinSets>

julia> psi == IdentityMorphism( Coproduct( [ M, N, P ] ) )
true

```

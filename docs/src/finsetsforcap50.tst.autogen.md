
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( 3 )
|3|

julia> R = FinSet( 2 )
|2|

julia> f = MapOfFinSets( S, [ 1, 1, 0 ], R )
|3| → |2|

julia> IsWellDefined( f )
true

julia> T = TerminalObject( SkeletalFinSets )
|1|

julia> IsTerminal( T )
true

julia> IsOne( CartesianLambdaIntroduction( IdentityMorphism( T ) ) )
true

julia> lf = CartesianLambdaIntroduction( f )
|1| → |8|

julia> Source( lf ) == T
true

julia> Display( Range( lf ) )
[ 0,..., 7 ]

julia> Display( lf )
[ 0 ] ⱶ[ 3 ]→ [ 0,..., 7 ]

julia> elf = CartesianLambdaElimination( S, R, lf )
|3| → |2|

julia> elf == f
true

julia> L = MorphismsOfExternalHom( S, R );

julia> Display( L )
[ [ 0, 1, 2 ] ⱶ[ 0, 0, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 0, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 0, 1, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 1, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 0, 0, 1 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 0, 1 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 0, 1, 1 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 1, 1 ]→ [ 0, 1 ] ]

julia> Li = List( L, phi -> CartesianLambdaIntroduction( phi ) );

julia> Display( Li )
[ [ 0 ] ⱶ[ 0 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 1 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 2 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 3 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 4 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 5 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 6 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 7 ]→ [ 0,..., 7 ] ]

julia> L == List( Li, psi -> CartesianLambdaElimination( S, R, psi ) )
true

```

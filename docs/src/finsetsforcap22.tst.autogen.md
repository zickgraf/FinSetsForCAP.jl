
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> S = FinSet( (1):(3) )
<An object in FinSets>

julia> R = FinSet( (1):(2) )
<An object in FinSets>

julia> f = MapOfFinSets( S, [ [1,2],[2,2],[3,1] ], R )
<A morphism in FinSets>

julia> IsWellDefined( f )
true

julia> T = TerminalObject( FinSets )
<An object in FinSets>

julia> IsTerminal( T )
true

julia> lf = CartesianLambdaIntroduction( f )
<A morphism in FinSets>

julia> Source( lf ) == T
true

julia> Length( Range( lf ) )
8

julia> lf( T[1] ) == f
true

julia> elf = CartesianLambdaElimination( S, R, lf )
<A morphism in FinSets>

julia> elf == f
true

```

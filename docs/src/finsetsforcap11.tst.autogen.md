
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> IsInitial( M )
false

julia> IsTerminal( M )
false

julia> I = InitialObject( FinSets )
<An object in FinSets>

julia> IsInitial( I )
true

julia> IsTerminal( I )
false

julia> iota = UniversalMorphismFromInitialObject( M )
<A morphism in FinSets>

julia> Display( I )
[ ]

julia> T = TerminalObject( FinSets )
<An object in FinSets>

julia> Display( T )
[ [ ] ]

julia> IsInitial( T )
false

julia> IsTerminal( T )
true

julia> pi = UniversalMorphismIntoTerminalObject( M )
<A morphism in FinSets>

julia> IsIdenticalObj( Range( pi ), T )
true

julia> t = FinSet( [ "Julia" ] )
<An object in FinSets>

julia> pi_t = UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( M, t )
<A morphism in FinSets>

julia> Display( List( M, pi_t ) )
[ "Julia", "Julia", "Julia" ]

```

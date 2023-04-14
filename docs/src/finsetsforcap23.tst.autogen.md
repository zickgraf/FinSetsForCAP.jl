
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( (1):(3) )
<An object in FinSets>

julia> n = FinSet( (1):(4) )
<An object in FinSets>

julia> f = MapOfFinSets( m, [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ] ], m )
<A morphism in FinSets>

julia> g = MapOfFinSets( n, [ [ 1, 3 ], [ 2, 2 ], [ 3, 1 ], [ 4, 2 ] ], m )
<A morphism in FinSets>

julia> IsLiftable( f, g )
true

julia> chi = Lift( f, g )
<A morphism in FinSets>

julia> Display( chi )
[ [ 1 .. 3 ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 3 ] ], [ 1 .. 4 ] ]

julia> PreCompose( Lift( f, g ), g ) == f
true

julia> IsLiftable( g, f )
false

julia> k = FinSet( (1):(100) )
<An object in FinSets>

julia> h = ListWithIdenticalEntries( Length( k ) - 3, 3 );

julia> h = Concatenation( h, [ 2, 1, 2 ] );

julia> h = MapOfFinSets( k, List( k, i -> [ i, h[i] ] ), m )
<A morphism in FinSets>

julia> IsLiftable( f, h )
true

julia> IsLiftable( h, f )
false

```

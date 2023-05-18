

```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> a = FinSet( (1):(2) );

julia> b = FinSet( (3):(5) );

julia> c = FinSet( (6):(8) );

julia> d = FinSet( (12):(13) );; 

julia> finsets = CapCategory( a );

julia> opposite = Opposite( finsets, "Opposite with all operations" );

julia> opposite_primitive = Opposite( finsets, "Opposite with primitive operations"; only_primitive_operations = true );

julia> alpha = MapOfFinSets( a, [ [ 1, 3 ], [ 2, 5 ] ], b );

julia> beta = MapOfFinSets( c, [ [ 6, 12 ], [ 7, 12 ], [ 8, 13 ] ], d );

julia> CartesianCategoriesTest( finsets, opposite, a, b, c, alpha, beta );

julia> CartesianCategoriesTest( finsets, opposite_primitive, a, b, c, alpha, beta );

julia> i = InitialObject( finsets );

julia> t = TerminalObject( finsets );

julia> alpha = UniversalMorphismFromInitialObject( a );

julia> beta = UniversalMorphismIntoTerminalObject( a );

julia> CartesianCategoriesTest( finsets, opposite, i, a, a, alpha, beta );

julia> CartesianCategoriesTest( finsets, opposite_primitive, i, a, a, alpha, beta );

julia> CartesianCategoriesTest( finsets, opposite, a, t, i, beta, alpha );

julia> CartesianCategoriesTest( finsets, opposite_primitive, a, t, i, beta, alpha );

julia> a = FinSet( (1):(2) );

julia> b = FinSet( (3):(5) );

julia> c = FinSet( (6):(8) );

julia> d = FinSet( (12):(13) );

julia> alpha = MapOfFinSets( a, [ [ 1, 3 ], [ 2, 5 ] ], b );

julia> beta = MapOfFinSets( c, [ [ 6, 12 ], [ 7, 12 ], [ 8, 13 ] ], d );

julia> CocartesianCategoriesTest( finsets, opposite, a, b, c, alpha, beta );

julia> CocartesianCategoriesTest( finsets, opposite_primitive, a, b, c, alpha, beta );

julia> i = InitialObject( finsets );

julia> t = TerminalObject( finsets );

julia> alpha = UniversalMorphismFromInitialObject( a );

julia> beta = UniversalMorphismIntoTerminalObject( a );

julia> CocartesianCategoriesTest( finsets, opposite, i, a, a, alpha, beta );

julia> CocartesianCategoriesTest( finsets, opposite_primitive, i, a, a, alpha, beta );

julia> CocartesianCategoriesTest( finsets, opposite, a, t, i, beta, alpha );

julia> CocartesianCategoriesTest( finsets, opposite_primitive, a, t, i, beta, alpha );

julia> a = FinSet( (1):(2) );

julia> b = FinSet( (3):(5) );

julia> BraidedCartesianCategoriesTest( finsets, opposite, a, b );

julia> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, b );

julia> a = FinSet( (6):(8) );

julia> b = FinSet( (12):(13) );

julia> BraidedCartesianCategoriesTest( finsets, opposite, a, b );

julia> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, b );

julia> i = InitialObject( finsets );

julia> a = FinSet( (5):(8) );

julia> BraidedCartesianCategoriesTest( finsets, opposite, i, a );

julia> BraidedCartesianCategoriesTest( finsets, opposite_primitive, i, a );

julia> BraidedCartesianCategoriesTest( finsets, opposite, a, i );

julia> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, i );

julia> t = TerminalObject( finsets );

julia> a = FinSet( (1):(3) );

julia> BraidedCartesianCategoriesTest( finsets, opposite, t, a );

julia> BraidedCartesianCategoriesTest( finsets, opposite_primitive, t, a );

julia> BraidedCartesianCategoriesTest( finsets, opposite, a, t );

julia> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, t );

julia> a = FinSet( (1):(2) );

julia> b = FinSet( (3):(5) );

julia> BraidedCocartesianCategoriesTest( finsets, opposite, a, b );

julia> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, b );

julia> a = FinSet( (6):(8) );

julia> b = FinSet( (12):(13) );

julia> BraidedCocartesianCategoriesTest( finsets, opposite, a, b );

julia> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, b );

julia> i = InitialObject( finsets );

julia> a = FinSet( (5):(8) );

julia> BraidedCocartesianCategoriesTest( finsets, opposite, i, a );

julia> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, i, a );

julia> BraidedCocartesianCategoriesTest( finsets, opposite, a, i );

julia> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, i );

julia> t = TerminalObject( finsets );

julia> a = FinSet( (1):(3) );

julia> BraidedCocartesianCategoriesTest( finsets, opposite, t, a );

julia> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, t, a );

julia> BraidedCocartesianCategoriesTest( finsets, opposite, a, t );

julia> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, t );

julia> a = FinSet( (1):(2) );

julia> L = [ FinSet( (2):(5) ), FinSet( (6):(7) ), FinSet( (3):(8) ) ];

julia> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );

julia> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );

julia> a = InitialObject( finsets );

julia> L = [ FinSet( (2):(5) ), FinSet( (6):(7) ), FinSet( (3):(8) ) ];

julia> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );

julia> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );

julia> a = FinSet( (1):(2) );

julia> L = [ FinSet( (2):(5) ), InitialObject( finsets ), FinSet( (3):(8) ) ];

julia> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );

julia> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );

julia> a = TerminalObject( finsets );

julia> L = [ FinSet( (2):(5) ), FinSet( (6):(7) ), FinSet( (3):(8) ) ];

julia> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );

julia> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );

julia> a = FinSet( (1):(2) );

julia> L = [ FinSet( (2):(5) ), TerminalObject( finsets ), FinSet( (3):(8) ) ];

julia> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );

julia> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );

julia> a = FinSet( (1):(2) );

julia> b = FinSet( [ 3 ] );

julia> c = FinSet( (6):(7) );

julia> d = FinSet( (12):(13) );

julia> t = TerminalObject( finsets );

julia> a_product_b = DirectProduct( a, b );

julia> c_product_d = DirectProduct( c, d );

julia> exp_ab = Exponential( a, b );

julia> exp_cd = Exponential( c, d );

julia> alpha = MapOfFinSets( a, [ [ 1, 3 ], [ 2, 3 ] ], b );

julia> beta = MapOfFinSets( c, [ [ 6, 12 ], [ 7, 13 ] ], d );

julia> gamma = UniversalMorphismIntoTerminalObject( a_product_b );

julia> delta = UniversalMorphismIntoTerminalObject( c_product_d );

julia> epsilon = MapOfFinSets( t, [ [ t[1], exp_ab[1] ] ], exp_ab );

julia> zeta = MapOfFinSets( t, [ [ t[1], exp_cd[2] ] ], exp_cd );

julia> CartesianClosedCategoriesTest( finsets, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> CartesianClosedCategoriesTest( finsets, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> i = InitialObject( finsets );

julia> i_product_a = DirectProduct( i, a );

julia> a_product_t = DirectProduct( a, t );

julia> exp_ia = Exponential( i, a );

julia> exp_at = Exponential( a, t );

julia> alpha = UniversalMorphismFromInitialObject( a );

julia> beta = UniversalMorphismIntoTerminalObject( a );

julia> gamma = UniversalMorphismIntoTerminalObject( i_product_a );

julia> delta = UniversalMorphismIntoTerminalObject( a_product_t );

julia> epsilon = MapOfFinSets( t, [ [ t[1], exp_ia[1] ] ], exp_ia );

julia> zeta = MapOfFinSets( t, [ [ t[1], exp_at[1] ] ], exp_at );

julia> CartesianClosedCategoriesTest( finsets, opposite, i, a, a, t, alpha, beta, gamma, delta, epsilon, zeta );

julia> CartesianClosedCategoriesTest( finsets, opposite_primitive, i, a, a, t, alpha, beta, gamma, delta, epsilon, zeta );

```

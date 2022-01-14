 

# The uniform-algebras package 
contains a few simplistic algebras, e.g.
- a zero which is not even a semigroup to be widely usable as a generic "nothing"; it is attempted to allow automatic instantiation (under construction),
- a ListForm class, which is a monoid and has generic operations to make and append to a list. 
- a collection of operations for "pointless" code writing, especially tuples with 4 or 5 elements.

This is a starter package, with no dependencies except for base, other uniform packages will build on it.

# Pointers to somewhat related things: 
- [uniform-pair](https://hackage.haskell.org/package/uniform-pair-0.1.15)
- [basement](https://hackage.haskell.org/package/basement) 

# Intension of *uniform* packages
The *uniform* packages are yet another attempt to select a useful subset from the overwhelming variety of the Haskell biotop. It was started in the 2010, grew over the years but was never packaged and put into Hackage; it is comparable to other similar attempts from which it has learned and occasionally copied code. 

The *uniform* approach is different from some others by:
- compatible with 'standard' Haskell, i.e. Haskell 2010 plus extensions as indicated in the modules,
- use the regular Haskell prelude,
- avoid name clashes as far as possible,
- combine logically connected operations in one place and in a form allowing coordinated use.

Issues with this approach: it is limited by the deeps of understanding of Haskell of the author and his experience. It shows a focus on understanding semantics (and formal ontology) linked to algebra applied to practical problems (Geographic Information Systems). 
It seems that efforts to construct coherent subsets of Haskell are limited by the complexity of the task -- the more comprehensive an environment should be the more complex is it to learn and use. The approach here is what emerged after some 25 years of using Haskell to write application oriented code, mostly to demonstrate theories in spatial information theory. 
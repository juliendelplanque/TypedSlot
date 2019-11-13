# TypedSlot
[![Build Status](https://travis-ci.org/hogoww/TypedSlot.svg?branch=master)](https://travis-ci.org/juliendelplanque/TypedSlot)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

An implementation of slot with type-checking.

## Install
In a playground, execute the following script:

```smalltalk
Metacello new
	repository: 'github://juliendelplanque/TypedSlot/src';
	baseline: 'TypedSlot';
	load
```

## TypedSlot
This project provides 4 kinds of "type" to provide to TypedSlot:

- Class: The slot will only accept objects that are kind of a given class.
- Trait: The slot will only accept objects for which the class is using a given trait.
- Block: The slot will only accept objects for satisfying a given block (i.e. the block returns true).
- Interface: The slot will only accept object for which the class implement a given interface.

### Enabling/Disabling type-checking
It is possible to enable/disable type checking on multiple level:

- Globally, a setting is available in the "Tools" section of the settings.
- At class-level by overriding class-side method `#isTypeCheckingEnabled` to let it return `true` (returns `false` by default).
- At instance-level by overriding instance-side method `#isTypeCheckingEnabled` to define a custom policy at instance level (using an instance variable for example).

### Class
One can define an object with a slot that can only accept integers.

```smalltalk
Object subclass: #ExampleTypedSlotUsingClass
	slots: { #integerSlot type: Integer }
	classVariables: {  }
	package: 'TypedSlot-Example'
```

Once this class is defined and the accessor and mutator for `#integerSlot` are defined, one can expect the following behaviour.

```smalltalk
object := ExampleTypedSlotUsingClass new.

object integerSlot. "nil"
object integerSlot: 1.
object integerSlot. "1"

object integerSlot: 'str'. "Raises a TypeViolation exception."
```

### Trait
One can define an object with a slot that can only accept objects for which the class uses a given trait.

```smalltalk
Object subclass: #ExampleTypedSlotUsingTrait
	slots: { #assertableSlot type: TAssertable }
	classVariables: {  }
	package: 'TypedSlot-Example'
```

Once this class is defined and the accessor and mutator for `#assertableSlot` are defined, one will only be able to set assertable objects in the `#assertableSlot`.

### Block

One can define an object with a slot that can only accept integers.

```smalltalk
Object subclass: #ExampleTypedSlotUsingBlock
	slots: { #greaterThanZeroSlot type: [ :x | x > 0 ] }
	classVariables: {  }
	package: 'TypedSlot-Example'
```

Once this class is defined and the accessor and mutator for `#greaterThanZeroSlot` are defined, one can expect the following behaviour.

```smalltalk
object := ExampleTypedSlotUsingBlock new.

object greaterThanZeroSlot. "nil"
object greaterThanZeroSlot: 1.
object integerSlot. "1"

object greaterThanZeroSlot: -1. "Raises a TypeViolation exception."
object greaterThanZeroSlot: 'test'. "Raises a TypeViolation exception because it does not understand some message."
```

### Interface
To be documented once this feature is stable. In the meantime, take a look at `TypedSlotInterfaceTest` and `TypedSlotRemoteInterfaceTest`.

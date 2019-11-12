Class {
	#name : #BaselineOfTypedSlot,
	#superclass : #BaselineOf,
	#category : #BaselineOfTypedSlot
}

{ #category : #baselines }
BaselineOfTypedSlot >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'TypedSlot';
				package: 'TypedSlotHogo';
				package: 'TypedSlot-Block' with: [ spec requires: #('TypedSlot') ];
				package: 'TypedSlot-Block-Tests' with: [ spec requires: #('TypedSlot-Block') ];
				package: 'TypedSlot-Class' with: [ spec requires: #('TypedSlot') ];
				package: 'TypedSlot-Class-Tests' with: [ spec requires: #('TypedSlot-Class') ];
				package: 'TypedSlot-Collection' with: [ spec requires: #('TypedSlot') ];
				package: 'TypedSlot-Collection-Tests' with: [ spec requires: #('TypedSlot-Collection') ];
				package: 'TypedSlot-Interface' with: [ spec requires: #('TypedSlot') ];
				package: 'TypedSlot-Interface-Tests' with: [ spec requires: #('TypedSlot-Interface') ];
				package: 'TypedSlot-Trait' with: [ spec requires: #('TypedSlot') ];
				package: 'TypedSlot-Trait-Tests' with: [ spec requires: #('TypedSlot-Trait') ];
				package: 'TypedSlot-Tests' with: [ spec requires: #('TypedSlot' 'TypedSlot-Class-Tests') ]
		]
]

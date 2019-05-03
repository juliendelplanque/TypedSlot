Extension { #name : #Trait }

{ #category : #'*TypedSlot-Trait' }
Trait >> checkObjectType: anObject [
	(self users includes: anObject class)
		ifFalse: [ self error: ('This kind of object can not be stored by the slot. It needs to use {1} trait.' format: { self name }) ]
]

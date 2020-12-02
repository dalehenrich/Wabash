Class {
	#name : 'WabashMethodServiceServer',
	#superclass : 'WabashMethodService',
	#instVars : [
		'methodService',
		'metaclasMethodService'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WabashMethodServiceServer >> _methodService [
	^methodService
]

{ #category : 'accessing' }
WabashMethodServiceServer >> _methodService: object [
	methodService := object
]

{ #category : 'accessing' }
WabashMethodServiceServer >> methodName [
	^ methodName ifNil: [ methodName := self _methodService selector asString ]
]

Class {
	#name : 'WabashClassServiceServer',
	#superclass : 'WabashClassService',
	#instVars : [
		'classService',
		'metaclassService',
		'methodServices',
		'metaclassMethodServices'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WabashClassServiceServer >> _classService [
	^classService
]

{ #category : 'accessing' }
WabashClassServiceServer >> _classService: object [
	classService := object
]

{ #category : 'accessing' }
WabashClassServiceServer >> _metaclassMethodServices [
	^ metaclassMethodServices
		ifNil: [ 
			metaclassMethodServices := Dictionary new.
			self _metaclassService _methods
				do: [ :svce | 
					| service |
					svce update.
					service := WabashMethodServiceServer new.
					service _methodService: svce.
					metaclassMethodServices at: svce name put: service ].
			metaclassMethodServices ]
]

{ #category : 'accessing' }
WabashClassServiceServer >> _metaclassMethodServices: object [
	metaclassMethodServices := object
]

{ #category : 'accessing' }
WabashClassServiceServer >> _metaclassService [
	^metaclassService
]

{ #category : 'accessing' }
WabashClassServiceServer >> _metaclassService: object [
	metaclassService := object
]

{ #category : 'accessing' }
WabashClassServiceServer >> _methodServices [
	^ methodServices
		ifNil: [ 
			methodServices := Dictionary new.
			self _classService _methods
				do: [ :svce | 
					| service |
					svce update.
					service := WabashMethodServiceServer new.
					service _methodService: svce.
					methodServices at: svce name put: service ].
			methodServices ]
]

{ #category : 'accessing' }
WabashClassServiceServer >> classMethodNamed: aString [
	^ self _metaclassMethodServices at: aString
]

{ #category : 'accessing' }
WabashClassServiceServer >> classMethodNames [
	^ self _metaclassMethodServices keys asArray sort
]

{ #category : 'accessing' }
WabashClassServiceServer >> instanceMethodNamed: aString [
	^ self _methodServices at: aString
]

{ #category : 'accessing' }
WabashClassServiceServer >> instanceMethodNames [
	^ self _methodServices keys asArray sort
]

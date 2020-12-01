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
	^methodServices
]

{ #category : 'accessing' }
WabashClassServiceServer >> classMethodNamed: aString [
	^ (remoteSelf classMethodNamed: aString) wait
]

{ #category : 'accessing' }
WabashClassServiceServer >> classMethodNames [
	^ (remoteSelf classMethodNames) wait
]

{ #category : 'accessing' }
WabashClassServiceServer >> instanceMethodNamed: aString [
	^ (remoteSelf instanceMethodNamed: aString) wait
]

{ #category : 'accessing' }
WabashClassServiceServer >> instanceMethodNames [
	^ (remoteSelf instanceMethodNames) wait
]

Class {
	#name : 'WabashPackageServiceServer',
	#superclass : 'WabashPackageService',
	#instVars : [
		'packageService',
		'classServices'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WabashPackageServiceServer >> _classServices [
	^ classServices
		ifNil: [ 
			classServices := Dictionary new.
			self _packageService _classes
				do: [ :svce | 
					| service otherSvce |
					svce update.
					service := WabashClassServiceServer new.
					otherSvce := RowanClassService new
						name: svce name;
						meta: svce meta not;
						minimalForClassNamed: svce name;
						update;
						yourself.
					svce meta
						ifTrue: [ 
							service
								_metaclassService: svce;
								classService: otherSvce ]
						ifFalse: [ 
							service
								_classService: svce;
								_metaclassService: otherSvce ].
					classServices at: svce name put: service ].
			classServices ]
]

{ #category : 'accessing' }
WabashPackageServiceServer >> _packageService [
	^packageService
]

{ #category : 'accessing' }
WabashPackageServiceServer >> _packageService: object [
	packageService := object
]

{ #category : 'accessing' }
WabashPackageServiceServer >> classNamed: aString [
	^ self _classServices at: aString
]

{ #category : 'accessing' }
WabashPackageServiceServer >> classNames [
	^ classNames ifNil: [ classNames := self _classServices keys asArray sort ]
]

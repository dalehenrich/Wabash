Class {
	#name : 'BaselineOfWabash',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfWabash'
}

{ #category : 'baselines' }
BaselineOfWabash >> baseline: spec [
	<baseline>
	spec
		for: #common
			do: [ spec
				package: 'Wabash-Core';
				package: 'Wabash-Client';
				package: 'Wabash-Server';
				package: 'Wabash-Client-Tests';
				package: 'Wabash-Server-Tests';
				yourself ].
	spec
		group: 'default' with: #('ALL').
]

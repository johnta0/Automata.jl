using Printf

struct Automaton
    states::Set # arbitrary set
    alphabets::Set{Char} # set of string
    transitions::Dict # double dict {a: {"0": a, "1" b}}
    initstate # arbitrary
    finalstates::Set # arbitrary set
end


"""
DFA: Deterministic Finite Automata

M = (Q, Σ, δ, q0, F)
Q: set of states
Σ: s.alphabets
δ: transition function
q0: initial state
F: final state
"""

struct DeterministicFiniteAutomaton <: Automaton
end

function DeterministicFiniteAutomaton(
    states::Set{Any},
    alphabets::Set{String},
    transitions::Dict,
    initstate,
    finalstates::Set{Any},
)
    return DeterministicFiniteAutomaton(

    )
end

function judge(dfa::DeterministicFiniteAutomaton, inputstring::string)
    """
        TODO: 状態を遷移させていき、最後の状態が final state に含まれるかどうかの boolean を返す
    """
    state = dfa.initstate
    for char in inputstring
        if !(char in dfa.alphabets)
            @printf("Error: invalid character: %s", char)
            return -1
        end
        state = dfa.transitions[state][char]
    end
    return state in dfa.finalstates # Bool
end


# TODO: implement NFA
struct NondeterministicFiniteAutomaton <: Automaton
end

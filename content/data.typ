#let unclip(res) = {
  res.filter(r => not r.clipped).enumerate().map(((i, r)) => {
    r.i = i
    r
  })
}

#let sort-by-circuit-size(res) = {
  res.sorted(key: r => r.total-circuit-size).enumerate().map(((i, r)) => {
    r.i = i
    r
  })
}

#let filter(res) = {
  res.filter(r => r.equivalence-rate > 0.35).enumerate().map(((i, r)) => {
    r.i = i
    r
  })
}

#let filter-rev(res) = {
  res.filter(r => r.equivalence-rate-rev > 0.35).enumerate().map(((i, r)) => {
    r.i = i
    r
  })
}

#let results-r1-b5q16-cprop = csv("../resources/results-r1-b5q16-cprop-smc.csv", row-type: dictionary)
#let results-r1-b5q16-cmyersrev-pmismc = csv("../resources/results-r1-b5q16-cmyersrev-pmismc-smc.csv", row-type: dictionary)
#let results-r1-b5q16-cmyersrev-p = csv("../resources/results-r1-b5q16-cmyersrev-p-smc.csv", row-type: dictionary)
#let results-r1-b5q16-cmyers-p = csv("../resources/results-r1-b5q16-cmyers-p-smc.csv", row-type: dictionary)
#let results-r1-b5q16-cpatience-p = csv("../resources/results-r1-b5q16-cpatience-p-smc.csv", row-type: dictionary)
#let results-r1-b5q16-cmyers-pmismc = csv("../resources/results-r1-b5q16-cmyers-pmismc-smc.csv", row-type: dictionary)

#let results-r1-b5q16 = results-r1-b5q16-cprop.enumerate().map(((i, r)) => {
  let cmyersrev-pmismc = results-r1-b5q16-cmyersrev-pmismc.find(r2 => r2.name == r.name)
  let cmyersrev-p = results-r1-b5q16-cmyersrev-p.find(r2 => r2.name == r.name)
  let cmyers-p = results-r1-b5q16-cmyers-p.find(r2 => r2.name == r.name)
  let cmyers-pmismc = results-r1-b5q16-cmyers-pmismc.find(r2 => r2.name == r.name)
  let cpatience-p = results-r1-b5q16-cpatience-p.find(r2 => r2.name == r.name)
  let num-gates-1 = float(r.numGates1)
  let num-gates-2 = float(r.numGates2)
  let total-circuit-size = num-gates-1 + num-gates-2
  let num-qubits-1 = int(r.numQubits1)
  let num-qubits-2 = int(r.numQubits2)

  (
    name: r.name,
    i: i,
    clipped: not ((r.finished == "true") and (cmyersrev-pmismc.finished == "true") and (cmyersrev-p.finished == "true") and (cmyers-pmismc.finished == "true") and (cmyers-p.finished == "true")),
    total-circuit-size: total-circuit-size,
    circuit-size-difference: calc.abs(num-gates-1 - num-gates-2),
    total-qubit-count: num-qubits-1 + num-qubits-2,
    qubit-count-difference: calc.abs(num-qubits-1 - num-qubits-2),
    equivalence-rate: float(cmyers-pmismc.diffEquivalenceCount) / total-circuit-size,
    equivalence-rate-rev: float(cmyersrev-pmismc.diffEquivalenceCount) / total-circuit-size,
    cprop: (
      mu: float(r.runTimeMean)
    ),
    cmyersrev-pmismc: (
      mu: float(cmyersrev-pmismc.runTimeMean)
    ),
    cmyersrev-p: (
      mu: float(cmyersrev-p.runTimeMean)
    ),
    cmyers-p: (
      mu: float(cmyers-p.runTimeMean)
    ),
    cmyers-pmismc: (
      mu: float(cmyers-pmismc.runTimeMean)
    ),
    cpatience-p: (
      mu: float(cpatience-p.runTimeMean)
    ),
  )
})

#let results-r1-b5q16-hist = {
  let min = calc.log(0.001)
  let max = calc.log(20)
  let bins = 15

  let bins-mu = range(bins + 1).map(x => calc.pow(10, min + x * (max - min) / bins))
  let cprop-mu = bins-mu.slice(1).map(_ => 0)
  let cmyersrev-pmismc-mu = bins-mu.slice(1).map(_ => 0)
  let cmyersrev-p-mu = bins-mu.slice(1).map(_ => 0)
  let cmyers-p-mu = bins-mu.slice(1).map(_ => 0)
  let cmyers-pmismc-mu = bins-mu.slice(1).map(_ => 0)
  let cpatience-p-mu = bins-mu.slice(1).map(_ => 0)

  for r in unclip(results-r1-b5q16) {
    for b in range(bins) {
      if bins-mu.at(b) <= r.cprop.mu and r.cprop.mu < bins-mu.at(b + 1) {
        cprop-mu.at(b) += 1
      }
      if bins-mu.at(b) <= r.cmyersrev-pmismc.mu and r.cmyersrev-pmismc.mu < bins-mu.at(b + 1) {
        cmyersrev-pmismc-mu.at(b) += 1
      }
      if bins-mu.at(b) <= r.cmyersrev-p.mu and r.cmyersrev-p.mu < bins-mu.at(b + 1) {
        cmyersrev-p-mu.at(b) += 1
      }
      if bins-mu.at(b) <= r.cmyers-p.mu and r.cmyers-p.mu < bins-mu.at(b + 1) {
        cmyers-p-mu.at(b) += 1
      }
      if bins-mu.at(b) <= r.cmyers-pmismc.mu and r.cmyers-pmismc.mu < bins-mu.at(b + 1) {
        cmyers-pmismc-mu.at(b) += 1
      }
      if bins-mu.at(b) <= r.cpatience-p.mu and r.cpatience-p.mu < bins-mu.at(b + 1) {
        cpatience-p-mu.at(b) += 1
      }
    }
  }

  let scientific(val) = {
    let exp = calc.floor(calc.log(val))
    [$#(calc.round(val / calc.pow(10, exp), digits: 2)) dot 10 ^ #exp$]
  }

  (
    bins-mu: bins-mu.slice(0, -1).zip(bins-mu.slice(1)).map(((s, e)) => [$<$ #scientific(e)]),
    cprop: (
      mu: cprop-mu
    ),
    cmyersrev-pmismc: (
      mu: cmyersrev-pmismc-mu
    ),
    cmyersrev-p: (
      mu: cmyersrev-p-mu
    ),
    cmyers-p: (
      mu: cmyers-p-mu
    ),
    cmyers-pmismc: (
      mu: cmyers-pmismc-mu
    ),
    cpatience-p: (
      mu: cpatience-p-mu
    )
  )
}

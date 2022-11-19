import { exec } from 'child_process';
import { argv } from 'process';
import { promisify } from 'util'

const exec2 = promisify(exec)

export let getCalcResults = async (input) => {
  console.log("in getCalc")
  console.log(input)
  const { stdout, stderr } = await exec2(`../actlib/_build/default/bin/main.exe '${input}'`)
    
  if (stderr) {
    console.error(`stderr: ${stderr}`);
    return;
  }
  return stdout
}


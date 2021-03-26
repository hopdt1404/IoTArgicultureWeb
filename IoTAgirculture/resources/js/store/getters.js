const getters = {
  /**
   * Demo code ----
   * newTask: state => state.newTask,
   * tasks: state => state.tasks.filter((task) => {return !task.completed}),
   * completedTask: state => state.tasks.filter((task) => {return task.completed})
   */
  newTask: state => state.newTask,
  tasks: state => state.tasks.filter((task) => {return !task.completed}),
  completedTask: state => state.tasks.filter((task) => {return task.completed})

};
export default getters

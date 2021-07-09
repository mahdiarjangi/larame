<template>
  <div class="row">
    <div class="col-md-4">
      <div class="card">
        <div class="card-header">
          <h4 class="h5 font-weight-bold mb-0">Add new task</h4>
        </div>
        <div class="card-body">
          <div class="form-group mb-0">
            <label for="name">Task name</label>
            <input
              v-model="task"
              @blur="saveTask"
              @keydown="tapParticipants"
              type="text"
              name="name"
              id="name"
              class="form-control"
              placeholder="Enter task name"
              autocomplete="off"
            />
          </div>
          <div class="form-group mb-0">
            <small
              v-if="activePeer"
              v-text="activePeer.name + ' is typing...'"
              class="font-weight-normal"
            ></small>
          </div>
        </div>
      </div>
      <div class="card mt-2">
        <div class="card-header">
          <h4 class="h5 font-weight-bold">
            Active participants
          </h4>
        </div>
        <div class="card-body">
          <ul class="p-0 m-0 pl-3">
            <li v-for="participant in participants" v-text="participant.name"></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-8 mt-sm-3 mt-lg-0">
      <ul v-if="tasks.length" class="list-group">
        <li v-for="task in tasks" v-text="task" class="list-group-item"></li>
      </ul>
      <div v-else class="p-4 bg-light rounded">
        <h4 class="text-muted font-weight-bold mb-0">Tasks not found</h4>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["project"],
  data() {
    return {
      task: "",
      tasks: [],
      participants: [],
      activePeer: false,
      activeTyping: false,
    };
  },
  computed: {
    channel() {
      return window.Echo.join("task." + this.project.id);
    },
  },
  created() {
    axios
      .get("/api/project/" + this.project.id + "/tasks")
      .then((response) => (this.tasks = response.data));

    this.channel
      .here((users) => {
        this.participants = users;
      })
      .joining((user) => {
        this.participants.push(user);
      })
      .leaving((user) => {
        this.participants.splice(this.participants.indexOf(user), 1);
      })
      .listen("TaskCreated", (e) => {
        this.addTask(e.task.name);
      })
      .listenForWhisper("typing", (e) => {
        this.activePeer = e;

        if (this.activeTyping) {
          clearTimeout(this.activeTyping);
        }

        this.activeTyping = setTimeout(() => {
          this.activePeer = false;
        }, 3000);
      });
  },
  methods: {
    tapParticipants() {
      this.channel.whisper("typing", {
        name: window.App.name,
      });
    },
    saveTask() {
      axios.post("/task/store", {
        name: this.task,
        project_id: this.project.id,
      });

      this.addTask(this.task);
    },
    addTask(task) {
      this.tasks.push(task);
      this.task = "";
    },
  },
};
</script>

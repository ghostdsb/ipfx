defmodule ExIpfs do
  @moduledoc """
  Documentation for `ExIpfs`.
  """
  alias ExIpfs.Conn

  @doc """
  Hello and Welcome to IPFS!

      ██╗██████╗ ███████╗███████╗
      ██║██╔══██╗██╔════╝██╔════╝
      ██║██████╔╝█████╗  ███████╗
      ██║██╔═══╝ ██╔══╝  ╚════██║
      ██║██║     ██║     ███████║
      ╚═╝╚═╝     ╚═╝     ╚══════╝

  If you're seeing this, you have successfully installed
  IPFS and are now interfacing with the ipfs merkledag!

  -------------------------------------------------------
  | Warning:                                              |
  |   This is alpha software. Use at your own discretion! |
  |   Much is missing or lacking polish. There are bugs.  |
  |   Not yet secure. Read the security notes for more.   |
  -------------------------------------------------------

  Check out some of the other files in this directory:
    - ./about
    - ./help
    - ./quick-start     <-- usage examples
    - ./readme          <-- this file
    - ./security-notes
  """
  def home do
    Conn.post("/cat?arg=QmQPeNsJPyVWPFDVHb77w8G42Fvo15z4bG2X8D2GhfbSXc")
  end

  def about do
    Conn.post("/cat?arg=QmQPeNsJPyVWPFDVHb77w8G42Fvo15z4bG2X8D2GhfbSXc/about")
  end

  def help do
    Conn.post("/cat?arg=QmQPeNsJPyVWPFDVHb77w8G42Fvo15z4bG2X8D2GhfbSXc/help")
  end

  def readme do
    Conn.post("/cat?arg=QmQPeNsJPyVWPFDVHb77w8G42Fvo15z4bG2X8D2GhfbSXc/readme")
  end

  def quick_start do
    Conn.post("/cat?arg=QmQPeNsJPyVWPFDVHb77w8G42Fvo15z4bG2X8D2GhfbSXc/quick-start")
  end

  def security_notes do
    Conn.post("/cat?arg=QmQPeNsJPyVWPFDVHb77w8G42Fvo15z4bG2X8D2GhfbSXc/security-notes")
  end

  # def add_cmd(file_path), do: setup_multipart_form(file_path) |> Conn.post("/add")

  def id, do: Conn.post("/id")

  def dns(arg) when is_bitstring(arg), do: Conn.post("/dns?arg=#{arg}")

  ## TODO: add get_cmd for output, archive, compress and compression level
  def get_cmd(multihash) when is_bitstring(multihash), do: Conn.post("/get?arg=#{multihash}")

  def cat_cmd(multihash) when is_bitstring(multihash), do: Conn.post("/cat?arg=#{multihash}")

  # Ls cmd TODO  Implement proper Json Format.
  def ls_cmd(multihash) when is_bitstring(multihash), do: Conn.post("/ls?arg=#{multihash}")

  def resolve(multihash), do: Conn.post("/resolve?arg=#{multihash}")

  def bitswap_ledger(peer_id), do: Conn.post("/bitswap/ledger?arg=#{peer_id}")

  def bitswap_stat, do: Conn.post("/bitswap/stat")

  def bitswap_unwant(keys), do: Conn.post("/bitswap/unwant?arg=#{keys}")

  def bitswap_wantlist(), do: Conn.post("/bitswap/wantlist")
  def bitswap_wantlist(peer), do: Conn.post("/bitswap/wantlist?peer", peer)

  def block_get(arg), do: Conn.post("/block/get?arg=#{arg}")

  # def block_put(file_path), do: setup_multipart_form(file_path) |> Conn.post("/block/put")

  def block_rm(multihash), do: Conn.post("/block/rm?arg=#{multihash}")

  def block_stat(multihash), do: Conn.post("/block/stat?arg=#{multihash}")

  def bootstrap_add_default, do: Conn.post("/bootstrap/add/default")

  def bootstrap_list, do: Conn.post("/bootstrap/list")

  def bootstrap_rm_all, do: Conn.post("bootstrap/rm/all")

  def config_edit, do: Conn.post("/config/edit")

  # def config_replace(file_path), do: setup_multipart_form(file_path) |> Conn.post("/config/replace")

  def config_show, do: Conn.post("/config/show")

  def dag_get(object), do: Conn.post("/dag/get?arg=#{object}")

  # def dag_put(file_path), do: setup_multipart_form(file_path) |> Conn.post("/dag/put")

  def swarm_peers, do: Conn.post("/swarm/peers")

  def swarm_addrs_local, do: Conn.post("/swarm/addrs/local")

  def swarm_connect(multihash), do: Conn.post("/swarm/connect?arg=#{multihash}")

  def swarm_filters_add(multihash), do: Conn.post("/swarm/filters/add?arg=#{multihash}")

  def swarm_filters_rm(multihash), do: Conn.post("/swarm/filters/rm?arg=#{multihash}")

  # def swarm_disconnect(multihash) when is_bitstring(multihash), do: Conn.post("/swarm/disconnect?arg=#{multihash}" )

  def commands, do: Conn.post("/commands")

  ## Currently throws an error due to the size of JSON response.
  def repo_verify, do: Conn.post("/repo/verify")

  def repo_version, do: Conn.post("/repo/version")

  def repo_stat, do: Conn.post("/repo/stat")

  def repo_gc, do: Conn.post("/repo/gc")

  def repo_fsck, do: Conn.post("/repo/fsck")

  def ping(id), do: Conn.post("/ping?arg=#{id}")

  def log_level(subsys, level), do: Conn.post("/log/level?arg=#{subsys}&arg=#{level}")

  def log_ls, do: Conn.post("/log/ls")

  def log_tail, do: Conn.post("/log/tail")

  def mount, do: Conn.post("/mount")

  def pubsub_ls, do: Conn.post("/pubsub/ls")

  def pubsub_peers, do: Conn.post("/pubsub/pub")

  def pubsub_pub(topic, data), do: Conn.post("/pubsub/pub?arg=#{topic}&arg=#{data}")

  def pubsub_sub(topic), do: Conn.post("/pubsub/sub?arg=#{topic}")

  def refs_local, do: Conn.post("/refs/local")

  # Update function  - takes in the current args for update.
  def update(args) when is_bitstring(args) do
    res = Conn.post("/update?arg=#{args}")
    res.body |> String.replace(~r/\r|\n/, "")
  end

  # version function - does not currently accept the optional arguments on golang client.
  def version(num \\ false, comm \\ false, repo \\ false, all \\ false) do
    Conn.post(
      "/version?number=#{to_string(num)}&commit=#{to_string(comm)}&repo=#{to_string(repo)}&all=#{to_string(all)}"
    )
  end

  def tour_list, do: Conn.post("/tour/list")

  def tour_next, do: Conn.post("/tour/next")

  def tour_restart, do: Conn.post("/tour/restart")

  def dht_find_peer(arg), do: Conn.post("/dht/findpeer?arg=#{arg}")

  def dht_find_provs(arg), do: Conn.post("/dht/findprovs?arg=#{arg}")

  def dht_get(arg), do: Conn.post("/dht/get?arg=#{arg}")

  def dht_provide(arg), do: Conn.post("/dht/provide?arg=#{arg}")

  def dht_put(key, value), do: Conn.post("/dht/put?arg=#{key}&arg=#{value}")

  def dht_query(peer_id), do: Conn.post("/dht/query?arg=#{peer_id}")

  def cmds_clear, do: Conn.post("/cmds/clear")

  def cmds_set_time(time), do: Conn.post("/cmds/set-time?arg=#{time}")

  def diag_net(), do: Conn.post("/diag/net")
  def diag_net(vis), do: Conn.post("/diag/net?vis=#{vis}")

  def diag_sys, do: Conn.post("/diag/sys")

  def key_gen(key), do: Conn.post("/key/gen?arg=#{key}")

  def key_list, do: Conn.post("/key/list")

  def object_data(multihash), do: Conn.post("/object/data?arg=#{multihash}")

  def object_diff(obj_a, obj_b), do: Conn.post("/object/diff?arg=#{obj_a}&arg=#{obj_b}")

  def object_get(multihash), do: Conn.post("/object/get?arg=#{multihash}")

  def object_links(multihash), do: Conn.post("/object/links?arg=#{multihash}")

  def object_new(), do: Conn.post("/object/new")
  def object_new(template), do: Conn.post("/object/new?arg=#{template}")

  def object_patch_add_link(multihash, name, object),
    do: Conn.post("/object/patch/add-link?arg=#{multihash}&arg=#{name}&arg=#{object}")

  def object_patch_append_data(multihash, data) do
    # setup_multipart_form(data) |> Conn.post("/object/patch/append-data?arg=#{multihash}" )
  end

  def object_patch_rm_link(multihash, name),
    do: Conn.post("/object/patch/rm-link?arg=#{multihash}&arg=#{name}")

  def object_patch_set_data(multihash, data) do
    # setup_multipart_form(data) |> Conn.post("/object/patch/set-data?arg=#{multihash}")
  end

  # def object_put(data), do: setup_multipart_form(data) |> Conn.post("/object/put")

  def object_stat(multihash), do: Conn.post("/object/stat?arg=#{multihash}")

  def pin_add(object), do: Conn.post("/pin/add?arg=#{object}")

  def pin_ls(), do: Conn.post("/pin/ls")
  def pin_ls(object), do: Conn.post("/pin/ls?arg=#{object}")

  def pin_rm(object), do: Conn.post("/pin/rm?arg=#{object}")

  def file_ls(object), do: Conn.post("/file/ls?arg=#{object}")

  def files_cp(source, dest), do: Conn.post("/files/cp?arg=#{source}&arg=#{dest}")

  def files_flush, do: Conn.post("/files/flush")

  def files_ls, do: Conn.post("/files/ls")

  def files_mkdir(path), do: Conn.post("/files/mkdir?arg=#{path}")

  def files_mv(source, dest), do: Conn.post("/files/mv?arg=#{source}&arg=#{dest}")

  def files_read(path), do: Conn.post("/files/read?arg=#{path}")

  def files_rm(path), do: Conn.post("/files/rm?arg=#{path}")

  def files_stat(path), do: Conn.post("/files/stat?arg=#{path}")

  # def files_write(path, data), do: setup_multipart_form(data) |> Conn.post("/files/write?arg=#{path}")

  def filestore_dups, do: Conn.post("/filestore/dups")

  def filestore_ls, do: Conn.post("/filestore/ls")

  def filestore_verify, do: Conn.post("/filestore/verify")

  def name_publish(path), do: Conn.post("/name/publish?arg=#{path}")

  def name_resolve, do: Conn.post("/name/resolve")

  # def tar_add(file), do: setup_multipart_form(file) |> Conn.post("/tar/add")

  def tar_cat(path), do: Conn.post("/tar/cat?arg=#{path}")

  def stats_bitswap, do: Conn.post("/stats/bitswap")

  def stats_bw, do: Conn.post("/stats/bw")

  def stats_repo, do: Conn.post("/stats/repo")
end

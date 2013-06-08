class HostsController < ApplicationController
  
  def index
    @hosts = current_user.hosts.order('hosts.interval, hosts.url')
  end
  
  def new
    @host = current_user.hosts.build
  end
  
  def create
    @host = current_user.hosts.build(host_params)
    if @host.save
      redirect_to hosts_path
    else
      render partial: 'new'
    end
  end
  
  def ping
    @hosts = current_user.hosts.order('hosts.interval, hosts.url')
    @hosts.each do |h|
      h.pings.build.perform
    end
    redirect_to hosts_path
  end
  
private
  def host_params
    params.require(:host).permit(:url, :interval, :enabled)
  end

end
